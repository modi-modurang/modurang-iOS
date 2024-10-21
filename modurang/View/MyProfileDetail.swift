//
//  MyProfileDetail.swift
//  modurang
//
//  Created by dgsw21 on 10/10/24.
//

import SwiftUI

struct MyProfileDetail: View {
    var body: some View {
        ZStack{
//            Rectangle()
//                .foregroundColor(.bgcolor)
//                .frame(width: 393, height: 520)
//                .cornerRadius(20)
//            Rectangle()
//                .foregroundColor(.white)
//                .frame(width: 360, height: 420)
//                .offset(y:20)
//                .cornerRadius(15)
//            
            VStack {
                Image("ProfileImage")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                
                Text("서진교")
                    .font(.custom("Pretendard-Medium", size: 20))
                    .padding(.bottom, 3)
                
                Text("머지가 뭔지 몰랐던 나는 머지않아 머지를 하게 되었다.\n 그런데 머지가 머지?")
                    .font(.custom("Pretendard-Regular", size: 12))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                
                
                    .padding(.bottom, 14.5)
                Divider()
                    .frame(width: 320)
                HStack{
                    VStack(alignment: .center){
                        
                        Image(systemName: "books.vertical")
                            .font(.system(size: 20))
                            .foregroundColor(.TEXT)
                            .padding(.bottom, 27)
                            .padding(.top, 14.5)
                        
                        Image(systemName: "building.columns.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.TEXT)
                            .padding(.bottom, 27)

                        Image(systemName: "book")
                            .font(.system(size: 20))
                            .foregroundColor(.TEXT)
                            .padding(.bottom, 27)

                        Image("github")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.bottom, 27)

                        Image(systemName: "house.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.TEXT)
                            .padding(.bottom, 27)

                    }
                    
                    VStack{
                        HStack {
                            Text("Class")
                                .font(.custom("Pretendard-Regular", size: 16))
                            
                            
                            Spacer()
                            Text("1202")
                                .font(.custom("Pretendard-Regular", size: 16))
                        }
                        .padding(.top, 17.5)
                        .padding(.bottom, 27)
                        HStack {
                            Text("Club")
                                .font(.custom("Pretendard-Regular", size: 16))
                            
                            Spacer()
                            Text("모디")
                                .font(.custom("Pretendard-Regular", size: 16))
                        }
                        .padding(.bottom, 27)
                        
                        HStack {
                            Text("Major")
                                .font(.custom("Pretendard-Regular", size: 16))
                            
                            Spacer()
                            Text("Full-stack Developer")
                                .font(.custom("Pretendard-Regular", size: 16))
                        }
                        .padding(.bottom, 27)
                        
                        HStack {
                            Text("Github")
                                .font(.custom("Pretendard-Regular", size: 16))
                            
                            Spacer()
                            Text("@9y06")
                                .font(.custom("Pretendard-Regular", size: 16))
                        }
                        .padding(.bottom, 27)
                        
                        HStack {
                            Text("Studies")
                                .font(.custom("Pretendard-Regular", size: 16))
                            
                            Spacer()
                            Text("공통")
                                .font(.custom("Pretendard-Regular", size: 16))
                        }
                        .padding(.bottom, 27)
                        
                    }
                    
                    .frame(width: 260)
                }
                
            }
            .padding()
            
        }
        
    }
}

#Preview {
    MyProfileDetail()
}
