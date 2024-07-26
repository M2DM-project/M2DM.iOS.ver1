//
//  ShopTypeEnum.swift
//  M2DM
//
//  Created by 최주리 on 7/19/24.
//

import Foundation

enum ShopTypeEnum {
    case shop
    case groupPurchase
    case secondhand
    
    var title: String {
        switch self {
        case .shop: "m2dm"
        case .groupPurchase: "공동구매"
        case .secondhand: "중고거래"
        }
    }
    
    var description: String {
        String(describing: self)
    }
}
