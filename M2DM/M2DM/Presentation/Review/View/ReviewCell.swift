//
//  ReviewCell.swift
//  M2DM
//
//  Created by 최주리 on 6/19/24.
//

import SwiftUI

struct ReviewCell: View {
    
    @State var rating: Int = 0
    var reviewText: String = "작성된 후기입니다."
    var date: String = "2024.01.02"

    var body: some View {
        HStack {
            Text(reviewText)
                .padding(.leading, 5)
            Spacer()
            VStack {
                StarRatingView(rating: $rating)
                Text(date)
                    .font(.system(size: 13))
                    .foregroundStyle(.textGray)
            }
        }
    }
}

#Preview {
    ReviewCell()
}
