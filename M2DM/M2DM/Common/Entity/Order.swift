//
//  Order.swift
//  M2DM
//
//  Created by 최주리 on 10/11/24.
//

import Foundation

struct Order: Decodable, Identifiable {
    let id: Int
    let name, contact, email, zipcode: String
    let streetAddr, detailAddr: String
    let price, qty: Int
    let product: Product?
    let groupPurchase: GroupPurchase?
    let cartItems: [CartItem]
}
