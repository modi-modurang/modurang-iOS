//
//  signupemail.swift
//  modurang
//
//  Created by dgsw21 on 9/14/24.
//

import SwiftUI

struct signupemail: View {
    //    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var email: String = ""
    @State private var checknumber: String = ""
    @State var tag:Int? = nil
    @Binding var isLoggedIn: Bool  // 로그인 상태를 전달받음
    @State private var isEmailVerified = false  // 이메일 인증 상태
    
    //    var backButton : some View {
    //        Button(
    //            action: {
    //                self.presentationMode.wrappedValue.dismiss()
    //            }) {
    //                Image(systemName: "chevron.backward")    // back button 이미지
    //                .aspectRatio(contentMode: .fit)
    //                .foregroundColor(Color.TEXT)
    //            }
    //    }
    var body: some View {
        //        NavigationView{
        ZStack{
            Color(.loginbgcolor)/*.ignoresSafeArea()*/
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
                    Text("이메일을\n입력해주세요")
                        .font(.custom("Pretendard-Bold", size: 24))
                        .foregroundColor(.TEXT)
                    
                }
                .padding(.leading, -170)
                .padding(.top, 1)
                
                VStack (alignment: .leading){
                    Text("이메일")
                        .font(.custom("Pretendard-Medium", size: 20)).foregroundColor(.TEXT)                        .padding(.leading, 16)
                    HStack {
                        TextField("이메일을 입력해주세요", text: $email)
                            .padding(.leading, 16)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        
                        Button(action: {
                            // 여기에 이메일 인증 번호 전송 로직 추가
                            print("인증번호가 전송되었습니다.")
                        }, label: {
                            Text("코드 전송")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                                .font(.custom("Pretendard-Medium", size: 12))
                                .background(Color.main3)
                                .cornerRadius(8)
                        })
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
                    Text("인증번호")
                        .font(.custom("Pretendard-Medium", size: 20)).foregroundColor(.TEXT)                        .padding(.leading, 16)
                    TextField("인증번호를 입력해주세요", text: $checknumber)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .autocapitalization(.none) // 첫 글자가 자동으로 대문자로 바뀌는 것을 막음
                        .keyboardType(.decimalPad)
                    
                    
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
                    NavigationLink(destination: signuppw(isLoggedIn: $isLoggedIn))
//                        isActive: $isEmailVerified  // 인증이 성공하면 비밀번호 설정 화면으로 이동
                    /*)*/ {
                        Button(action: {
                            // 이메일 인증 확인 로직 추가
                            if checknumber == "123456" {  // 여기에 실제 인증 확인 로직 추가
                                isEmailVerified = true  // 인증 성공
                            } else {
                                print("인증 실패")
                            }
                        }) {
                            Text("다음")
                                .font(.custom("Pretendard-SemiBold", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(Color.main3)
                                .cornerRadius(10)
                        }
                        
                        .frame(width:340)
                        .padding(.top, 16)
                    }
                }
            }
            
            //        .padding(.bottom, 300)
            .ignoresSafeArea(.keyboard)
            Spacer()  // 고정된 레이아웃 유지
            
        }
    }
    //}
}
#Preview {
    signupemail(isLoggedIn: .constant(false))
}
