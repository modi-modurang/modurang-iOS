//
//  home.swift
//  modurang
//
//  Created by dgsw21 on 9/14/24.
//

import SwiftUI
struct home: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color(.bgcolor).ignoresSafeArea()
                
                VStack{
                    HStack{
                        Image("mdr_logo_gradient_h")
                            .resizable()
                            .frame(width: 100)
                            .frame(height: 32)
                            .padding(.trailing, 80)
                            .padding(.leading,110)
                        Image(systemName: "bell.fill")
                            .imageScale(.large)
                            .foregroundColor(.moduranggray)
                    }

                    Text("대구소프트웨어마이스터고의 동아리 스페이스")
                        .font(.custom("Pretendard-SemiBold", size: 18))
                        .frame(width: 340)
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                        .offset(x:-13)
                    
                }
                .padding(.bottom, 630)
                ScrollBar()
                    .offset(y:-210)
                
                Text("모디의 워크 스페이스")
                    .font(.custom("Pretendard-SemiBold", size: 18))
                    .offset(x:-100,y:-120)
        
                
                ClubBanner()
                    .offset(x:0,y:-60)
                VStack{
                    HStack{
                        Rectangle()
                            .foregroundColor(.white2A2A2A)
                            .frame(width: 164, height: 85)
                            .cornerRadius(7)
                            .shadow(radius: 3)
                            .overlay{
                                Rectangle()
                                    .frame(width: 36, height: 16)
                                    .foregroundColor(.webbg)
                                    .cornerRadius(2)
                                    .overlay{
                                        Text("Web")
                                            .font(.custom("Pretendard-SemiBold", size: 12))

                                    }
                            }
                        Rectangle()
                            .foregroundColor(.white2A2A2A)
                            .frame(width: 164, height: 85)
                            .cornerRadius(7)
                            .shadow(radius: 3)
                            .overlay{
                                Rectangle()
                                    .frame(width: 47, height: 16)
                                    .foregroundColor(.serverbg)
                                    .cornerRadius(2)
                                    .overlay{
                                        Text("Server")
                                            .font(.custom("Pretendard-SemiBold", size: 12))

                                    }
                            }

                    }
                    HStack{
                        Rectangle()
                            .foregroundColor(.white2A2A2A)
                            .frame(width: 164, height: 85)
                            .cornerRadius(7)
                            .shadow(radius: 3)
                            .overlay{
                                Rectangle()
                                    .frame(width: 36, height: 16)
                                    .foregroundColor(.allbg)
                                    .cornerRadius(2)
                                    .overlay{
                                        Text("All")
                                            .font(.custom("Pretendard-SemiBold", size: 12))

                                    }
                            }

                        Rectangle()
                            .foregroundColor(.white2A2A2A)
                            .frame(width: 164, height: 85)
                            .cornerRadius(7)
                            .shadow(radius: 3)
                            .overlay{
                                Rectangle()
                                    .frame(width: 36, height: 16)
                                    .foregroundColor(.iOSbg)
                                    .cornerRadius(2)
                                    .overlay{
                                        Text("iOS")
                                            .font(.custom("Pretendard-SemiBold", size: 12))

                                    }
                            }
                    }
                }
                .offset(y:100)
                
            }
            
        }
        .navigationBarBackButtonHidden(true) // 뒤로가기 버튼 숨기기
    }
}
struct homeController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIHostingController(rootView: home())
        controller.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update logic if needed
    }
}
#Preview {
    home()
}
