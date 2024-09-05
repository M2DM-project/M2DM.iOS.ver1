//
//  OrderResponse.swift
//  M2DM
//
//  Created by 최주리 on 9/5/24.
//

import Foundation

struct OrderResponse: Decodable {
    let statusCode: Int
    let message: String
    // 임시
    let content: Product?
}
