//
//  OrderRequest.swift
//  M2DM
//
//  Created by 최주리 on 9/5/24.
//

import Foundation

struct OrderRequest: Encodable {
    var name: String
    var contact: String
    var zipcode: String
    var streetAddr: String
    var detailAddr: String
}

struct CartOrderRequest: Encodable {
    var itemIds: [Int]
    var orderDto: OrderRequest
}
