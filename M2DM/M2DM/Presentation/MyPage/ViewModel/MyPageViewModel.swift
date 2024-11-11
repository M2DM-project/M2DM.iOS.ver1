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
//    @Published private(set) var orders
    
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
            
            for item in orders {
                
            }
        }
    }
}
