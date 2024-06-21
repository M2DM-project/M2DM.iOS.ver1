//
//  StarRatingView.swift
//  M2DM
//
//  Created by 최주리 on 6/21/24.
//

import SwiftUI

struct StarRatingView: View {
    
    @Binding var rating: Int
    var fontSize: CGFloat = 12
    var isWriting: Bool = false
    
    var body: some View {
        HStack (spacing: 0) {
            ForEach(0..<5) { _ in
                Image(systemName: "star.fill")
                    .foregroundStyle(.textLightGray)
                    .aspectRatio(contentMode: .fill)
            }
        }.overlay(
            GeometryReader { reader in
                HStack (spacing: 0) {
                    ForEach(0..<5) { num in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.accent)
                            .aspectRatio(contentMode: .fill)
                            .onTapGesture {
                                if isWriting {
                                    rating = num + 1
                                }
                            }
                    }
                }
                .clipShape(
                    StarShape(width: (reader.size.width / CGFloat(5)) * CGFloat(rating))
                )
            }
        )
        .font(.system(size: fontSize))
    }
}

struct StarShape: Shape {
    let width: Double
    
    func path(in rect: CGRect) -> Path {
        Path(CGRect(x: rect.minX, y: rect.minY, width: width, height: rect.height))
    }
}
