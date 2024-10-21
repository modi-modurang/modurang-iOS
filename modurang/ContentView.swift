//
//  ContentView.swift
//  modurang
//
//  Created by dgsw21 on 8/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showIntro: Bool = true  // 인트로 뷰 표시 상태
    @State private var isLoggedIn: Bool = false  // 로그인 상태
    @State private var selection: Tab = .home  // TabView를 위한 상태
    
    enum Tab {
        case home
        case calendar
        case workspace
        case myprofile
    }
    
    var body: some View {
        ZStack {
            if showIntro {
                // 인트로 뷰
                onbording()
            } else if !isLoggedIn {
                // 로그인 뷰
                login(isLoggedIn: $isLoggedIn)  // 로그인 뷰로 로그인 상태를 전달
            } else {
                // 로그인 후 TabView
                TabView(selection: $selection) {
                    home()
                        .tabItem {
                            Label("홈", systemImage: "house.fill")
                        }
                        .tag(Tab.home)
                    
                    modurangcalendar()
                        .tabItem {
                            Label("캘린더", systemImage: "calendar")
                        }
                        .tag(Tab.calendar)
                    
                    workspace()
                        .tabItem {
                            Label("워크스페이스", systemImage: "building.columns.fill")
                        }
                        .tag(Tab.workspace)
                    
                    MyProfile()
                        .tabItem {
                            Label("내 프로필", systemImage: "person.crop.circle")
                        }
                        .tag(Tab.myprofile)
                }
            }
        }
        .onAppear {
            // 0.8초 후 인트로 화면을 숨기고 로그인 화면으로 전환
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                showIntro = false
            }
        }
    }
}

#Preview {
    ContentView()
}
