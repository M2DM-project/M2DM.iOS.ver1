//
//  Review.swift
//  M2DM
//
//  Created by 최주리 on 6/18/24.
//

import Foundation

struct Review: Identifiable, Decodable {
    let id: Int
    let star: Int
    let content: String
    let date: String
    let product: Product
}
