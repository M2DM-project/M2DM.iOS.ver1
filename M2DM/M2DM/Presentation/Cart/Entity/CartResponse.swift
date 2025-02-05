//
//  CartResponse.swift
//  M2DM
//
//  Created by 최주리 on 7/3/24.
//

import Foundation

struct CartAddResponse: Decodable {
    let statusCode: Int
    let message: String
    let content: String?
}

struct CartViewResponse: Decodable {
    let statusCode: Int
    let message: String
    let content: Cart
}
