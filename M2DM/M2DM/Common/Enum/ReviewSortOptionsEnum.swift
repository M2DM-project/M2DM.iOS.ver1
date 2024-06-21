//
//  ReviewSortOptions.swift
//  M2DM
//
//  Created by 최주리 on 6/21/24.
//

import Foundation

enum ReviewSortOptionEnum: CaseIterable {
    case newest
    case lowstar
    case highstar
    
    var title: String {
        switch self {
        case .newest: "최신순"
        case .lowstar: "평점낮은순"
        case .highstar: "평점높은순"
        }
    }
    
    var description: String {
        String(describing: self)
    }
}
