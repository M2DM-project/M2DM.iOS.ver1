//
//  GroupPurchaseResponse.swift
//  M2DM
//
//  Created by 최주리 on 8/1/24.
//

import Foundation

struct GroupPurchaseResponse : Decodable {
    let statusCode: Int
    let message: String
    let content: [GroupPurchase]
}
