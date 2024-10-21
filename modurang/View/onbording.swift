//
//  onbording.swift
//  modurang
//
//  Created by dgsw21 on 9/2/24.
//

import SwiftUI

struct onbording: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.modurang1, Color.modurang2, Color.main3, Color.modurang4]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("mdr_logo_white_v")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("모두를 위한 동아리 관리 서비스, 모두랑").font(Font.custom("Pretendard-Semibold", size: 20)).foregroundColor(Color.white)
                
            }
        }
    }
}

#Preview {
    onbording()
}
