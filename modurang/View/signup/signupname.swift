//
//  signupname.swift
//  modurang
//
//  Created by dgsw21 on 9/14/24.
//

import SwiftUI

struct signupname: View {
    @State private var username: String = ""
    @State private var usernumber: String = ""
    @State var tag:Int? = nil
    @Binding var isLoggedIn: Bool  // 로그인 상태를 전달받음
    
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
                    Text("이름과 학번을\n입력해주세요")
                        .font(.custom("Pretendard-Bold", size: 24))
                        .foregroundColor(.TEXT)
                    
                }
                .padding(.leading, -170)
                .padding(.top, 1)
                
                VStack (alignment: .leading){
                    Text("이름")
                        .font(.custom("Pretendard-Medium", size: 20)).foregroundColor(.TEXT)                        .padding(.leading, 16)
                    TextField("이름을 입력해주세요", text: $username)
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
                VStack (alignment: .leading){
                    Text("학번")
                        .font(.custom("Pretendard-Medium", size: 20)).foregroundColor(.TEXT)                   .padding(.leading, 16)
                    TextField("학번을 입력해주세요", text: $usernumber)
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
                
                VStack{
                    NavigationLink(destination: signupemail(isLoggedIn: $isLoggedIn)){
                        Text("다음")
                            .font(.custom("Pretendard-SemiBold", size: 20))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(.main3)
                            .cornerRadius(10)
                    }
                    .frame(width:340)
                    .padding(.top, 16)
                }
                        
            }
            
        }
        
        
        .ignoresSafeArea(.keyboard)
        Spacer()  // 고정된 레이아웃 유지
        .navigationDestination(for: String.self) { value in  // NavigationDestination 사용
                if value == "signupemail" {
                    signupemail(isLoggedIn: $isLoggedIn)
                }
        }
    }
}


#Preview {
    signupname(isLoggedIn: .constant(false))
}
