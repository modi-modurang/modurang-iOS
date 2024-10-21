//
//  login.swift
//  modurang
//
//  Created by dgsw21 on 9/14/24.
//

import SwiftUI
import Alamofire

struct login: View {

    @Environment(\.isEnabled) var isEnabled
    @State private var allValid = false
    @State private var showAlert = false
    @State private var alertMessage: String = ""       // 알림 메시지를 저장하는 상태 변수
    @State private var emailValid: Bool = false        // 이메일 유효성을 확인하는 상태 변수
    @State private var passwordValid: Bool = false     // 비밀번호 유효성을 확인하는 상태 변수

    @State var tag:Int? = nil
    @ObservedObject private var loginVM = loginViewModel()
    @Binding var isLoggedIn: Bool  // 로그인 상태를 부모에서 받아옴

    let emailPattern = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$"
    let passwordPattern = "^(?=.*\\d)(?=.*[a-zA-Z]).{8,16}$"
    var body: some View {

        NavigationView{
            ZStack{
                Color(.loginbgcolor).ignoresSafeArea()
                
                VStack{
                    VStack{
                        Text("모두랑 로그인")
                            .font(.custom("TmoneyRoundWind-ExtraBold", size: 20))
                            .foregroundColor(.clear) // 텍스트 자체의 색을 없앰
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.modurang1, Color.modurang2, Color.main3, Color.modurang4]),
                                    startPoint: .trailing,
                                    endPoint: .leading)
                                .mask(
                                    Text("모두랑 로그인") // 동일한 텍스트를 마스크로 사용
                                        .font(.custom("TmoneyRoundWind-ExtraBold", size: 20))
                                )
                            )
                    }
                    .padding(.leading, -170)
                    VStack{
                        Text("이메일과 비밀번호를\n입력해주세요")
                            .font(.custom("Pretendard-Bold", size: 24))
                            .foregroundColor(.TEXT)
                        
                    }
                    .padding(.leading, -150)
                    .padding(.top, 1)
                    
                    VStack (alignment: .leading){
                        Text("이메일")
                            .font(.custom("Pretendard-Medium", size: 20))
                            .foregroundColor(.TEXT)
                            .padding(.leading, 16)
                        TextField("이메일을 입력해주세요", text: $loginVM.email)
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                            .autocapitalization(.none) // 첫 글자가 자동으로 대문자로 바뀌는 것을 막음
                            .onChange(of: loginVM.email) { _ in           // 이메일 입력이 변경될 때마다 유효성 검사
                                checkEmail()
                            }
                        
                        Rectangle()
                            .frame(width: 340)
                            .frame(height: 1)
                            .foregroundColor(.TEXT)
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .frame(width: 340)
                    
                    VStack (alignment: .leading){
                        Text("비밀번호")
                            .font(.custom("Pretendard-Medium", size: 20))
                            .foregroundColor(.TEXT)
                            .padding(.leading, 16)
                        SecureField("비밀번호를 입력해주세요", text: $loginVM.password)
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                            .autocapitalization(.none) // 첫 글자가 자동으로 대문자로 바뀌는 것을 막음
                            .onChange(of: loginVM.password) { _ in         // 비밀번호 입력이 변경될 때마다 유효성 검사
                                checkPassword()
                            }
                        Rectangle()
                            .frame(width: 340)
                            .frame(height: 1)
                            .foregroundColor(.TEXT)
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .frame(width: 340)
                    
                    HStack{
                        Text("모두랑 계정이 없다면?")
                            .font(.custom("Pretendard-Medium", size: 12))
                            .foregroundColor(.TEXT)
                        NavigationLink(destination: signupname(isLoggedIn: $isLoggedIn)){
                            Text("회원가입 하기")
                                .font(.custom("Pretendard-SemiBold", size: 12))
                                .underline()
                                .foregroundColor(.main3)
                        }
                    }
                    .padding(.top, 16)
                    VStack {
                        Button(action: {
                            if allValid {
                                loginUser()
                            } else {
                                alertMessage = "입력된 정보를 확인해주세요."
                                showAlert = true
                            }
                        }) {
                            Text("로그인")
                                .font(.custom("Pretendard-SemiBold", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(Color.main3)
                                .cornerRadius(10)

                        }
                        .frame(width: 340)
                        .padding(.top, 16)
                        
                        .alert(isPresented: $showAlert) {              // 알림을 표시하는 alert
                            Alert(title: Text("오류!"), message: Text(alertMessage), dismissButton: .default(Text("확인")))

                            
                        }
                    }

                    
                }
            }
            
        }
        .ignoresSafeArea(.keyboard)
        Spacer()
        
        
    }
    // 이메일 유효성 검사 함수
    func checkEmail() {
        emailValid = isValid(text: loginVM.email, pattern: emailPattern)
        checkAllValid()                               // 전체 유효성 검사
    }
    
    // 비밀번호 유효성 검사 함수
    func checkPassword() {
        passwordValid = isValid(text: loginVM.password, pattern: passwordPattern)
        checkAllValid()                               // 전체 유효성 검사
    }
    
    // 이메일과 비밀번호가 모두 유효한지 확인하는 함수
    func checkAllValid() {
        allValid = emailValid && passwordValid        // 둘 다 유효하면 allValid는 true
    }
    
    // 입력된 텍스트가 정규 표현식에 맞는지 확인하는 함수
    func isValid(text: String, pattern: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: text)
    }

    func loginUser() {
        let parameters: [String: String] = [
            "email": loginVM.email,
            "password": loginVM.password
        ]
        struct LoginResponse: Decodable {
            let data: AuthData
            let status: Int
            let message: String?
        }

        struct AuthData: Decodable {
            let accessToken: String
            let refreshToken: String
        }
        AF.request("https://d2ad-221-168-22-204.ngrok-free.app/auth/login",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: ["Content-Type": "application/json"])
            .validate()
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let data): 
                    // 로그인 성공 시
                    print("로그인 성공, Access Token: \(data.data.accessToken), Refresh Token: \(data.data.refreshToken)")
                     self.alertMessage = "로그인이 완료되었습니다."
                     self.isLoggedIn = true // 로그인 상태 업데이트
                     self.showAlert = true
                    
                    do {
                        try KeychainManager.save(token: data.data.accessToken) // accessToken 저장
                    } catch {
                        print("키체인 저장 실패: \(error)")
                    }

                    alertMessage = "로그인이 완료되었습니다."  // 성공 메시지
                    showAlert = true                          // 알림을 표시
                    
                case .failure(let error):
                    alertMessage = "로그인 실패: \(error.localizedDescription)"  // 실패 시 오류 메시지
                    showAlert = true                          // 알림을 표시
                    if let data = response.data, let jsonString = String(data: data, encoding: .utf8) {
                        print("서버 응답: \(jsonString)")
                    } else {
                        print("응답 데이터가 없습니다.")
                    }
                }
            }
    }
}

#Preview {
    login(isLoggedIn: .constant(false))
}
