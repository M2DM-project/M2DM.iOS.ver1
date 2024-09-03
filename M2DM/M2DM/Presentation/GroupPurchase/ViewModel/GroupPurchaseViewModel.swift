//
//  GroupPurchaseViewModel.swift
//  M2DM
//
//  Created by 최주리 on 8/1/24.
//

import SwiftUI

final class GroupPurchaseViewModel: ObservableObject {
    @Published private(set) var selectedSortOption: SortOptionEnum = .newest
    @Published private(set) var selectedCategory: CategoryEnum = .GEN
    
    @Published private(set) var gpList: [GroupPurchase] = []
    @Published private(set) var product: GroupPurchase = GroupPurchase(id: 0, name: "error", price: 0, content: "error", state: .FAIL, imgUrl: "error", maxQty: 0, nowQty: 0, goalQty: 0, start: "error", end: "error", category: Category(id: 0, cateCode: "error", name: "error"))
    
    var dataManager: GroupPurchaseProtocol
    
    init() {
        dataManager = GroupPurchaseClass.shared
    }
    
    //MARK: - READ
    
    @MainActor
    func loadAllGPList() async {
        gpList = await dataManager.loadAllGPList().content
        
        #if DEBUG
        print("\(gpList.count)")
        #endif
    }
    
    @MainActor
    func loadSortedProductList(category: CategoryEnum, sortOption: SortOptionEnum) async {
        selectedCategory = category
        selectedSortOption = sortOption
        
        gpList = await dataManager.loadProductBySort(category: category.description, sortOption: sortOption.description).content
        
        #if DEBUG
        print("\(gpList.count)")
        #endif
    }
    
    @MainActor
    func loadSearchGPProductList(searchText: String) async {
        gpList = await dataManager.loadSearchGPProduct(searchText: searchText).content
        
        #if DEBUG
        print("\(gpList.count)")
        #endif
    }
    
    @MainActor
    func loadOneProduct(id: Int) {
        if let index = gpList.firstIndex(where: {$0.id == id}) {
            product = gpList[index]
        }
        
        #if DEBUG
        print("\(product.name)")
        #endif
    }
    
}
