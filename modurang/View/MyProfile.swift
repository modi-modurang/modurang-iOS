//
//  myprofile.swift
//  modurang
//
//  Created by dgsw21 on 10/8/24.
//

import SwiftUI

struct MyProfile: View {
    @Environment(\.editMode) var editMode
    
//    @State private var draftProfile = MyProfile.default

    var body: some View {

        ZStack{
            Color(.bgcolor).ignoresSafeArea()

            VStack{

                Text("내 프로필")
                    .font(.custom("Pretendard-SemiBold", size: 24))
                    .padding(.trailing, 240)
                    .padding(.bottom, 30)
                Rectangle()
                    .frame(width: 340, height: 400)
                    .foregroundColor(.white2A2A2A)
                    .cornerRadius(15)
                    .shadow(color: Color.gray.opacity(0.3), radius: 7)

                    .overlay{
                        MyProfileDetail()
                            .padding(.top, -50)
                            
                        
                    }
                    .padding(.bottom, 20)

                VStack{
                        Button(action: {print("helloworld")}, label: {
                            HStack{
                                Text("서비스 운영 정책")
                                    .font(.custom("Pretendard-Medium", size: 16))
                                    .foregroundColor(.TEXT)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.TEXT)
                                
                            }
                        })
                        .padding(.bottom, 20)
                        .frame(width: 324)
                        
                        Button(action: {print("helloworld")}, label: {
                            HStack{
                                Text("개인정보 처리방침")
                                    .font(.custom("Pretendard-Medium", size: 16))
                                    .foregroundColor(.TEXT)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.TEXT)
                                
                            }
                        })
                        .frame(width: 324)
                        .padding(.bottom, 10)

                    
                    Divider()
                        .frame(width: 320)
                        
                    Button(action: {print("helloworld")}, label: {
                            HStack{
                                Text("로그아웃")
                                    .font(.custom("Pretendard-Medium", size: 16))
                                    .foregroundColor(.TEXT)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.TEXT)
                                
                            }
                        })
                        .frame(width: 324)
                        .padding(.bottom, 20)
                        .padding(.top, 10)

                    Button(action: {print("helloworld")}, label: {
                            HStack{
                                Text("회원탈퇴")
                                    .font(.custom("Pretendard-Medium", size: 16))
                                    .foregroundColor(.red)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.red)
                                
                            }
                        })
                        .frame(width: 324)
                        .padding(.bottom, 20)
//                        .padding(.bottom, )

                }
                
            }
            
//                    .ignoresSafeArea()

        }
        
    }
}
#Preview {
    MyProfile()
}
