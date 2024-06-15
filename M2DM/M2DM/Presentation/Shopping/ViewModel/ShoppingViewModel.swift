//
//  ShoppingViewModel.swift
//  M2DM
//
//  Created by 최주리 on 5/26/24.
//

import Foundation

final class ShoppingViewModel: ObservableObject {
    @Published private(set) var selectedSortOption: SortOptionEnum = .newest
    @Published private(set) var selectedCategory: CategoryEnum = .GEN
    
    @Published private(set) var productList: [Product] = []
    
    var dataManager: ShoppingProtocol
    
    init() {
        dataManager = Shopping.shared
    }
    
    //MARK: - READ
    
    @MainActor
    func loadAllProduct() async {
        
        productList = await dataManager.loadAllProduct().content
        
        #if DEBUG
        print("\(productList.count)")
        #endif
        
    }
    
    @MainActor
    func loadSortedProductList(category: CategoryEnum, sortOption: SortOptionEnum) async {
        selectedCategory = category
        selectedSortOption = sortOption
        
        productList = await dataManager.loadProductBySort(category: category.description, sortOption: sortOption.description).content
        
        #if DEBUG
        print("\(productList.count)")
        #endif
    }
    
    @MainActor
    func loadSearchProductList(searchText: String) async {
        productList = await dataManager.loadSearchProduct(searchText: searchText).content
        
        #if DEBUG
        print("\(productList.count)")
        #endif
    }
}
