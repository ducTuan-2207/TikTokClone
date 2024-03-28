//
//  FeedView.swift
//  TikTokClone
//
//  Created by macOS on 28/03/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 10) { post in
                    Rectangle()
                        .containerRelativeFrame([.horizontal, .vertical])
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
