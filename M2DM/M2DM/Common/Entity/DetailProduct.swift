//
//  DetailProduct.swift
//  M2DM
//
//  Created by 최주리 on 6/18/24.
//

import Foundation

struct DetailProduct: Identifiable, Decodable {
    let id: Int
    let cateCode: String
    let name: String
    let price: Int
    let content: String
    let imgUrl: String
    let favState: String
    let reviewList: [Review]
    let reviewCnt: Int
    let reviewStarAvg: Int
}
