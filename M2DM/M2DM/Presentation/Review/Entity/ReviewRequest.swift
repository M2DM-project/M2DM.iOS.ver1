//
//  ReviewRequest.swift
//  M2DM
//
//  Created by 최주리 on 6/21/24.
//

import Foundation

struct ReviewRequest: Encodable {
    var prodId: Int
    var star: Int
    var date: String
    var content: String
}
