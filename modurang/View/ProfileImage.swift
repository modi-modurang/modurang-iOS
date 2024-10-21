//
//  ProfileImage.swift
//  modurang
//
//  Created by dgsw21 on 10/10/24.
//

import SwiftUI

struct ProfileImage: View {
    var body: some View {
        Image("ProfileImage")
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.gray, lineWidth: 2)

            }
            .shadow(radius: 7)

    }
}

#Preview {
    ProfileImage()
}
