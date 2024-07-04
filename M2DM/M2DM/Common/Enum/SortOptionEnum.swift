//
//  SortOption.swift
//  M2DM
//
//  Created by 최주리 on 5/26/24.
//

import Foundation

enum SortOptionEnum: CaseIterable {
    case newest
    case lowprice
    case highprice
    
    var title: String {
        switch self {
        case .newest: "최신순"
        case .lowprice: "낮은금액순"
        case .highprice: "높은금액순"
        }
    }
    
    var description: String {
        String(describing: self)
    }
}
