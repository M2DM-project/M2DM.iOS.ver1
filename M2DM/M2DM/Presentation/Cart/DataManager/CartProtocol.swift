//
//  CartProtocol.swift
//  M2DM
//
//  Created by 최주리 on 7/2/24.
//

import Foundation
import Alamofire

protocol CartProtocol {

}

final class CartClass {
    static let shared: CartProtocol = CartClass()
}

extension CartClass: CartProtocol {
    
}
