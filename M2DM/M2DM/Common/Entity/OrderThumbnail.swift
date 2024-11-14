//
//  OrderThumbnail.swift
//  M2DM
//
//  Created by 최주리 on 11/11/24.
//

import Foundation

struct OrderThumbnail: Identifiable {
    let id: Int
    let name: String
    let price: Int
    let imgUrl: String
    let qty: Int
}
