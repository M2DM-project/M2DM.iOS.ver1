//
//  GroupPurchase.swift
//  M2DM
//
//  Created by 최주리 on 8/1/24.
//

import Foundation

struct GroupPurchase: Decodable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let content: String
    let state: GroupPurchaseState
    let imgUrl: String
    let maxQty: Int
    let nowQty: Int
    let goalQty: Int
    let start: String
    let end: String
    let category: Category
}
