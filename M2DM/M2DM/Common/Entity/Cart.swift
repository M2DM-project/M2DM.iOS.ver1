//
//  Cart.swift
//  M2DM
//
//  Created by 최주리 on 7/4/24.
//

import Foundation

struct Cart: Decodable {
    let id: Int
    let count: Int
    let price: Int
    let cartItems: [CartItem]
}

struct CartItem: Decodable, Identifiable {
    let id: Int
    let count: Int
    let price: Int
    let product: Product
}
