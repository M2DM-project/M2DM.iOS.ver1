//
//  OrderViewModel.swift
//  M2DM
//
//  Created by 최주리 on 9/5/24.
//

import Foundation

final class OrderViewModel: ObservableObject {
    @Published var cartList: [Int] = []
    @Published var price: Int = 0
    @Published var qty: Int = 0
    @Published var productId: Int = 0
    
    var dataManager: OrderProtocol
    
    init() {
        dataManager = OrderClass.shared
    }
    
    func orderProduct(id: Int, qty: Int, name: String, contact: String, zipcode: String, street: String, detail: String) {
        Task {
            let request = OrderRequest(name: name, contact: contact, zipcode: zipcode, streetAddr: street, detailAddr: detail)
            await dataManager.orderProduct(id, qty, request)
        }
    }
    
    func addCartToOrder(name: String, contact: String, zipcode: String, street: String, detail: String) {
        Task {
            let request = CartOrderRequest(itemIds: cartList, orderDto: OrderRequest(name: name, contact: contact, zipcode: zipcode, streetAddr: street, detailAddr: detail))
            await dataManager.orderCart(request)
        }
    }
}
