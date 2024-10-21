//
//  workspace.swift
//  modurang
//
//  Created by dgsw21 on 10/8/24.
//

import SwiftUI

struct workspace: View {
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color(.bgcolor).ignoresSafeArea()
                
                HStack{
                    Text("워크스페이스")
                        .font(.custom("Pretendard-SemiBold", size: 24))
                        .padding(.trailing, 190)
                        .foregroundColor(.TEXT)
                    Image(systemName: "bell.fill")
                        .imageScale(.large)
                        .foregroundColor(.moduranggray)
                }
                .padding(.bottom, 690)

                VStack{
                    Image("modibanner")
                    Rectangle()
                        .frame(width: 347, height: 226)
                        .foregroundColor(.white2A2A2A)
                        .cornerRadius(7)
                        .overlay{
                            Text("모디 동아리 규칙")
                                .font(.custom("Pretendard-SemiBold", size: 16))
                                .offset(x:-100,y:-80)
                            
                            
                            
                            
                        }
                    VStack{
                        Text("-")
                            .padding(.bottom, 20)
                        Text("-")
                            .padding(.bottom, 20)
                        
                        Text("-")
                            .padding(.bottom, 20)
                    }
                    .offset(x:-150, y:-170)
                    
                    VStack{
                        Rectangle()
                            .frame(width: 347, height: 226)
                            .foregroundColor(.white2A2A2A)
                            .cornerRadius(7)
                            .overlay{
                                Text("모디 과제")
                                    .font(.custom("Pretendard-SemiBold", size: 16))
                                    .offset(x:-100,y:-80)
                                
                                
                                
                                
                            }
//                        VStack{
//                            Text("-")
//                                .padding(.bottom, 20)
//                            Text("-")
//                                .padding(.bottom, 20)
//                            
//                            Text("-")
//                                .padding(.bottom, 20)
//                        }
//                        .offset(x:-150, y:-170)
                        
                    }
                    .padding(.bottom, -50)
                    
                    
                    
                    
                    
                    //                }
                }
            }
        }
    }
    struct workspaceController: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            let controller = UIHostingController(rootView: home())
            controller.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            return controller
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            // Update logic if needed
        }
    }
}
#Preview {
    workspace()
}
