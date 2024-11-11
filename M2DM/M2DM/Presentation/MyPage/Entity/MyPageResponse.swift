//
//  MyPageResponse.swift
//  M2DM
//
//  Created by 최주리 on 9/6/24.
//

import Foundation

struct MyPageResponse: Decodable {
    let statusCode: Int
    let message: String
    let content: MyInfo
}

struct MyOrderResponse: Decodable {
    
    let statusCode: Int
    let message: String
    let content: [Order]
}
