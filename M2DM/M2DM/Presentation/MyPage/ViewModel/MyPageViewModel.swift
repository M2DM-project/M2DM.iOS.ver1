//
//  MyPageViewModel.swift
//  M2DM
//
//  Created by 최주리 on 9/6/24.
//

import SwiftUI

@MainActor
final class MyPageViewModel: ObservableObject {
    @Published private(set) var user: MyInfo = MyInfo(id: 0, nickname: "", email: "", password: "", profileImgUrl: "", role: .ADMIN, streetAddr: "", detailAddr: "", zipcode: "")
    
    @Published private(set) var orderCount = 0
    @Published private(set) var orders: [Order] = []
    @Published private(set) var orderItems: [OrderThumbnail] = []
    
    var dataManager: MyPageProtocol
    
    init() {
        dataManager = MyPageClass.shared
    }
    
    func loadUserInfo() {
        Task {
            user = await dataManager.loadMyInfo().content
        }
    }
    
    func loadMyOrder() {
        Task {
            orders = await dataManager.laodOrder().content
            orderCount = orders.count
            orderItems = []
            
            // product로 하나 주문했을 때 or catItem으로 여러개 주문했을 때
            for item in orders {
                if let item = item.product {
                    let orderItem = OrderThumbnail(id: item.id, name: item.name, price: item.price, imgUrl: item.imgUrl, qty: 1)
                    orderItems.append(orderItem)
                } else if item.cartItems.count > 0 {
                    let cartItem = item.cartItems[0].product
                    let orderItem = OrderThumbnail(id: cartItem.id, name: cartItem.name, price: cartItem.price, imgUrl: cartItem.imgUrl, qty: item.cartItems.count)
                    orderItems.append(orderItem)
                }
            }
        }
    }
}
