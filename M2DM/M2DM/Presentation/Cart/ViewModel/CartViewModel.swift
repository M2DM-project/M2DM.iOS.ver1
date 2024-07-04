//
//  CartViewModel.swift
//  M2DM
//
//  Created by 최주리 on 7/2/24.
//

import Foundation

final class CartViewModel: ObservableObject {
    @Published private(set) var cart: Cart = Cart(id: 0, count: 0, price: 0, cartItems: [])
    @Published private(set) var cartItems: [CartItem] = []
//    @Published private(set) var selectedProduct: [CartItem] = []
    @Published private(set) var isAllSelected: Bool = false
    
    var dataManager: CartProtocol
    
    init() {
        dataManager = CartClass.shared
    }
    
    @MainActor
    func loadCartItems() async {
        cartItems = await dataManager.loadCartItems().content.cartItems
        cart = await dataManager.loadCartItems().content
    }
    
    func addCartItem(prodId: Int) async {
        await dataManager.addCartItem(prodId: prodId)
    }
    
    @MainActor
    func increaseCartItem(itemId: Int) async {
        await dataManager.increaseCartItem(itemId: itemId)
    }
    
    @MainActor
    func decreaseCartItem(itemId: Int) async {
        await dataManager.decreaseCartItem(itemId: itemId)
    }
    
}
