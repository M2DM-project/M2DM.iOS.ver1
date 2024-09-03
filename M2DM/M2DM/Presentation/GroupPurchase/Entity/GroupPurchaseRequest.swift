//
//  GroupPurchaseRequest.swift
//  M2DM
//
//  Created by 최주리 on 8/13/24.
//

import Foundation

struct GroupPurchaseRequest: Encodable {
    var name: String
    var contact: String
    var zipcode: String
    var streetAddr: String
    var detailAddr: String
}
