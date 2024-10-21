//
//  TabBar.swift
//  modurang
//
//  Created by dgsw21 on 10/10/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            
            home()
            .tabItem {
              Image(systemName: "house.fill")
              Text("홈")
            }
            
            modurangcalendar()
            .tabItem {
              Image(systemName: "calendar")
              Text("캘린더")
            }
            
            workspace()
            .tabItem {
              Image(systemName: "building.columns.fill")
              Text("워크 스페이스")
            }
            
            MyProfile()
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("내 프로필")
            }

        }
//        .frame( width:360, height:52)
//        .cornerRadius(16)
        .font(.headline)
        .accentColor(.main3)
        .onAppear {
            UITabBar.appearance().backgroundColor = .whiteblack
        }

    }
}

#Preview {
    TabBar()
}
