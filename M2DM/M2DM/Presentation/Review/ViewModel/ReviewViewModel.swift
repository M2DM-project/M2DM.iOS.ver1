//
//  ReviewViewModel.swift
//  M2DM
//
//  Created by 최주리 on 6/19/24.
//

import SwiftUI

final class ReviewViewModel: ObservableObject {
    
    @Published private(set) var selectedSortOption: ReviewSortOptionEnum = .newest
    
    var dataManager: ReviewProtocol
    
    init() {
        dataManager = ReviewClass.shared
    }
    
    @MainActor
    func loadSortedReviewList(sortOption: ReviewSortOptionEnum) async {
        selectedSortOption = sortOption
        
        #if DEBUG
        #endif
    }
}
