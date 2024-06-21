//
//  ReviewResponse.swift
//  M2DM
//
//  Created by 최주리 on 6/21/24.
//

import Foundation

struct ReviewResponse: Decodable {
    let statusCode: Int
    let message: String
    let content: String?
}
