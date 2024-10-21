//
//  ProfileEditor.swift
//  modurang
//
//  Created by dgsw21 on 10/21/24.
//

//import SwiftUI
//
//struct ProfileEditor: View {
//    @Binding var MyProfile: MyProfile
//
//    var body: some View {
//        List {
//            HStack {
//                Text("Username")
//                Spacer()
//                TextField("Username", text: $profile.username)
//                    .foregroundStyle(.secondary)
//                    .multilineTextAlignment(.trailing)
//            }
//            
//            Toggle(isOn: $profile.prefersNotifications) {
//                Text("Enable Notifications")
//            }
//            
//            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
//                ForEach(Profile.Season.allCases) { season in
//                    Text(season.rawValue).tag(season)
//                }
//            }
//            
//            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
//                Text("Goal Date")
//            }
//        }
//    }    }
//}
//
//#Preview {
//    ProfileEditor(MyProfile: .constant(.default))
//}
