//
//  CartProtocol.swift
//  M2DM
//
//  Created by 최주리 on 7/2/24.
//

import Foundation
import Alamofire

protocol CartProtocol {
    func addCartItem(prodId: Int) async
}

final class CartClass {
    static let shared: CartProtocol = CartClass()
}

extension CartClass: CartProtocol {
    
    func addCartItem(prodId: Int) async {
        let url = "\(Constant.BASE_URL)/cartItem/add/\(prodId)/1"
        let token = KeyChain.read(key: "access_token") ?? ""
        
        #if DEBUG
        print("\(url)")
        print("\(token)")
        #endif
        let request = AF.request(url,
                                 method: .post,
                                 parameters: nil,
                                 encoding: JSONEncoding.default,
                                 headers: ["Authorization": "Bearer \(token)"])
        let dataTask = request.serializingDecodable(CartResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            #if DEBUG
            print("장바구니 저장 성공?")
            print("\(value.message)")
            #endif
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("장바구니 저장 실패")
            #endif
        }
    }
}
