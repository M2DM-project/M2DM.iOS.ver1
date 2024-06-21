//
//  ReviewViewModel.swift
//  M2DM
//
//  Created by 최주리 on 6/19/24.
//

import SwiftUI

final class ReviewViewModel: ObservableObject {
    @EnvironmentObject private var shoppingViewModel: ShoppingViewModel
    
    @Published private(set) var selectedSortOption: ReviewSortOptionEnum = .newest
    
    @Published private(set) var reviewList: [Review] = []
    
    @Published var product: DetailProduct = DetailProduct(id: 0, cateCode: "error", name: "error", price: 0, content: "error", imgUrl: "error", favState: "error", reviewList: [], reviewCnt: 0, reviewStarAvg: 0)
    
    var dataManager: ReviewProtocol
    
    init() {
        dataManager = ReviewClass.shared
    }
    
    @MainActor
    func getProduct(product: DetailProduct) {
        self.product = product
    }
    
    @MainActor
    func loadAllReviewList() {
        self.reviewList = self.product.reviewList
    }
    
    @MainActor
    func loadSortedReviewList(sortOption: ReviewSortOptionEnum) async {
        selectedSortOption = sortOption
        
        #if DEBUG
        #endif
    }
    
    @MainActor
    func addReview(id: Int, star: Int, content: String) async {
        let request = ReviewRequest(prodId: id, star: star, date: MyDateFormatter.shared.dateToString(from: Date()), content: content)
        
        await dataManager.addReview(id: id, request)
    }
}
