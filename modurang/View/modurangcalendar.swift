//
//  calendar.swift
//  modurang
//
//  Created by dgsw21 on 9/26/24.
//

import SwiftUI

struct modurangcalendar: View {
    @State private var date = Date()
    var body: some View {
        NavigationView{
            ZStack{
                Color(.bgcolor).ignoresSafeArea()
                HStack{
//                    .navigationTitle("달력")
                    Text("달력")
                        .font(.custom("Pretendard-SemiBold", size: 24))
                        .padding(.trailing, 260)
                        .foregroundColor(.TEXT)
                    Image(systemName: "bell.fill")
                        .imageScale(.large)
                        .foregroundColor(.moduranggray)
                }
                .padding(.bottom, 690)

                VStack{
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                        
                    )
                    .accentColor(.main3) // 강조 색상 설정
                    .font(.custom("Pretendard", size: 20))
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .datePickerStyle(.graphical)
                }
                .padding(.bottom, 310)
                
                
//                navigationTitle("달력")
                
                
                
            }
        }
        
    }
}
struct modurangcalendarController: UIViewControllerRepresentable {
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
    modurangcalendar()
}
