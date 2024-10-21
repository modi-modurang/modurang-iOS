//
//  signuppw.swift
//  modurang
//
//  Created by dgsw21 on 9/14/24.
//

import SwiftUI

struct signuppw: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var password: String = ""
    @State private var passwordcheck: String = ""
    @Environment (\.dismiss) private var dismiss
    @Binding var isLoggedIn: Bool  // 로그인 상태를 전달받음
    
    var body: some View {
        //        NavigationView{
        ZStack{
            Color(.loginbgcolor).ignoresSafeArea()
            VStack{
                
                VStack{
                    Text("모두랑 시작하기")
                        .font(.custom("TmoneyRoundWind-ExtraBold", size: 20))
                    //                    .fontWeight(.bold)
                        .foregroundColor(.clear) // 텍스트 자체의 색을 없앰
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.modurang1, Color.modurang2, Color.main3, Color.modurang4]),
                                startPoint: .trailing,
                                endPoint: .leading)
                            .mask(
                                Text("모두랑 시작하기") // 동일한 텍스트를 마스크로 사용
                                    .font(.custom("TmoneyRoundWind-ExtraBold", size: 20))
                            )
                        )
                }
                .padding(.leading, -170)
                VStack{
                    Text("비밀번호를\n입력해주세요")
                        .font(.custom("Pretendard-Bold", size: 24))
                        .foregroundColor(.TEXT)
                    
                }
                .padding(.leading, -170)
                .padding(.top, 1)
                
                VStack (alignment: .leading){
                    Text("비밀번호")
                        .font(.custom("Pretendard-Medium", size: 20)).foregroundColor(.TEXT)                        .padding(.leading, 16)
                    HStack{
                        SecureField("비밀번호를 입력해주세요", text: $password)
                            .padding(.leading, 16)
                            .autocapitalization(.none) // 첫 글자가 자동으로 대문자로 바뀌는 것을 막음
                    }
                    Rectangle()
                        .frame(width: 340)
                        .frame(height: 1)
                        .foregroundColor(.TEXT)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    
                }
                .padding(.top, 16)
                .frame(width: 340)
                VStack (alignment: .leading){
                    Text("비밀번호 확인")
                        .font(.custom("Pretendard-Medium", size: 20)).foregroundColor(.TEXT)                        .padding(.leading, 16)
                    SecureField("비밀번호를 입력해주세요", text: $passwordcheck)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .autocapitalization(.none) // 첫 글자가 자동으로 대문자로 바뀌는 것을 막음
                    
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
                
                VStack {
                    Button(action: {
                        // 비밀번호 확인 로직 추가
                        if password == passwordcheck {
                            // 회원가입 처리 완료 후 로그인 상태로 변경
                            isLoggedIn = true
                            dismiss()  // 현재 뷰 닫기
                        } else {
                            // 비밀번호 불일치 경고 처리
                        }
                    }) {
                        Text("회원가입 완료")
                            .font(.custom("Pretendard-SemiBold", size: 20))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.main3)
                            .cornerRadius(10)
                    }
                    .frame(width: 340)
                    .padding(.top, 16)
                }
                //                .frame(width:340)
                //                .padding(.top, 16)
            }
            //        .padding(.bottom, 300)
            .ignoresSafeArea(.keyboard)
            Spacer()
        }
        
    }
}

    //}
#Preview {
        signuppw(isLoggedIn: .constant(false))
}
