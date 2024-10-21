//
//  markdown.swift
//  modurang
//
//  Created by dgsw21 on 9/25/24.
//

import SwiftUI

struct markdown: View {
    let markdownText = """
    # Hello, Markdown!
    This is a **bold** text, and this is _italic_ text.
    You can also create [links](https://apple.com) or even lists:
    - Item 1
    - Item 2
    """

    var body: some View {
        ScrollView {
            Text(markdownText)
                .padding()
        }
    }
}


#Preview {
    markdown()
}
