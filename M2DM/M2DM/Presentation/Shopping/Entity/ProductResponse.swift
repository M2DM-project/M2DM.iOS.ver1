//
//  ProductResponse.swift
//  M2DM
//
//  Created by 최주리 on 5/26/24.
//

import Foundation

struct ProductListResponse: Decodable {
    let statusCode: Int
    let message: String
    let content: [Product]
}

struct OneProductResponse: Decodable {
    let statusCode: Int
    let message: String
    let content: DetailProduct
}
