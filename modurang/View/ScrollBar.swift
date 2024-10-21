//
//  ScrollBar.swift
//  modurang
//
//  Created by dgsw21 on 10/10/24.
//

import SwiftUI

struct ScrollBar: View {
    var body: some View {
        ScrollView(.horizontal,  showsIndicators: false){
            HStack(spacing: 0){
                ForEach(0..<9) { _ in
                    Image("modi")
                }
            }
            .padding(.leading, 20)
        }
    }
}

#Preview {
    ScrollBar()
}
