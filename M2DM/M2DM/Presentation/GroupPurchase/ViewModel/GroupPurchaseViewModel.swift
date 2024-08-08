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
        
//        productList = await dataManager.loadProductBySort(category: category.description, sortOption: sortOption.description).content
        
        #if DEBUG
//        print("\(productList.count)")
        #endif
    }
    
    @MainActor
    func loadSearchProductList(searchText: String) async {
//        productList = await dataManager.loadSearchProduct(searchText: searchText).content
        
        #if DEBUG
//        print("\(productList.count)")
        #endif
    }
    
    @MainActor
    func loadOneProduct(id: Int) async {
//        product = await dataManager.loadOneProduct(id: id).content
        
        #if DEBUG
//        print("\(product.name)")
        #endif
    }
    
}
