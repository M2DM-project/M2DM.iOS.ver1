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
    @Published private(set) var selectedCartItemsId: [Int] = []
    @Published private(set) var selectedCartItemsSum: Int = 0
    @Published private(set) var isAllSelected: Bool = true
    
    var dataManager: CartProtocol
    
    init() {
        dataManager = CartClass.shared
    }
    
    @MainActor
    func firstLoadCartItems() async {
        Task {
            cartItems = await dataManager.loadCartItems().content.cartItems
            cart = await dataManager.loadCartItems().content
            selectedCartItemsId = cartItems.map { $0.id }
            selectedCartItemsSum = cart.price
        }
    }
    
    @MainActor
    func reloadCartItems() async {
        cartItems = await dataManager.loadCartItems().content.cartItems
        cart = await dataManager.loadCartItems().content
        getSum()
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
    
    @MainActor
    func deleteCartItems() async {
        Task {
            await dataManager.deleteCartItems(itemsId: selectedCartItemsId)
            cartItems = []
            selectedCartItemsId = []
        }
    }
    
    @MainActor
    func toggleSelectedItemsId(item: CartItem) {
        Task {
            if selectedCartItemsId.contains(item.id) {
                selectedCartItemsId.remove(at: selectedCartItemsId.firstIndex(of: item.id)!)
            } else {
                selectedCartItemsId.append(item.id)
            }
            
            if selectedCartItemsId.count == cart.cartItems.count {
                isAllSelected = true
            } else {
                isAllSelected = false
            }
            
            getSum()
        }
    }
    
    @MainActor
    func toggleAllSelectedItems() {
        Task {
            if isAllSelected {
                isAllSelected = false
                selectedCartItemsId = []
                getSum()
            } else {
                isAllSelected = true
                selectedCartItemsId = cartItems.map { $0.id }
                getSum()
            }
        }
    }
    
    func getSum() {
        selectedCartItemsSum = 0
        
        for item in cartItems{
            if selectedCartItemsId.contains(item.id) {
                selectedCartItemsSum += item.price
            }
        }
    }
}
