//
//  Product.swift
//  M2DM
//
//  Created by 최주리 on 5/26/24.
//

import Foundation

struct Product: Identifiable, Decodable {
    let id: Int
    let category: Category
    let name: String
    let price: Int
    let content: String
    let imgUrl: String
    let reviewCnt: Int
    let reviewStarAvg: Int
}
