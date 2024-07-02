//
//  CartViewModel.swift
//  M2DM
//
//  Created by 최주리 on 7/2/24.
//

import Foundation

final class CratViewModel: ObservableObject {
    @Published private(set) var cartProduct: [Product] = []
    @Published private(set) var selectedProduct: [Product] = []
    @Published private(set) var isAllSelected: Bool = false
    
    var dataManager: CartProtocol
    
    init() {
        dataManager = CartClass.shared
    }
    
    
}
