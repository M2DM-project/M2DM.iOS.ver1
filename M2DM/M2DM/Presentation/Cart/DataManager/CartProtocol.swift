//
//  CartProtocol.swift
//  M2DM
//
//  Created by 최주리 on 7/2/24.
//

import Foundation
import Alamofire

protocol CartProtocol {
    func loadCartItems() async -> CartViewResponse
    func addCartItem(prodId: Int) async
    func increaseCartItem(itemId: Int) async
    func decreaseCartItem(itemId: Int) async
}

final class CartClass {
    static let shared: CartProtocol = CartClass()
}

extension CartClass: CartProtocol {
    
    func loadCartItems() async -> CartViewResponse {
        let url = "\(Constant.BASE_URL)/cart"
        let token = KeyChain.read(key: "access_token") ?? ""
        
        #if DEBUG
        print("\(url)")
        print("\(token)")
        #endif
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default,
                                 headers: ["Authorization": "Bearer \(token)"])
        let dataTask = request.serializingDecodable(CartViewResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            #if DEBUG
            guard let _ = await dataTask.response.response else {return CartViewResponse(statusCode: 400, message: "client error", content: Cart(id: 0, count: 0, price: 0, cartItems: []))}
            return value
            #endif
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("장바구니 불러오기 실패")
            #endif
            return CartViewResponse(statusCode: 400, message: "client error", content: Cart(id: 0, count: 0, price: 0, cartItems: []))
        }
    }
    
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
        let dataTask = request.serializingDecodable(CartAddResponse.self)
        
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
    
    func increaseCartItem(itemId: Int) async {
        let url = "\(Constant.BASE_URL)/cartItem/increase/\(itemId)"
        let token = KeyChain.read(key: "access_token") ?? ""
        
        #if DEBUG
        print("\(url)")
        print("\(token)")
        #endif
        let request = AF.request(url,
                                 method: .put,
                                 parameters: nil,
                                 encoding: JSONEncoding.default,
                                 headers: ["Authorization": "Bearer \(token)"])
        let dataTask = request.serializingDecodable(CartAddResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            #if DEBUG
            print("장바구니 increase 성공?")
            print("\(value.message)")
            #endif
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("장바구니 increase 실패")
            #endif
        }
    }
    
    func decreaseCartItem(itemId: Int) async {
        let url = "\(Constant.BASE_URL)/cartItem/decrease/\(itemId)"
        let token = KeyChain.read(key: "access_token") ?? ""
        
        #if DEBUG
        print("\(url)")
        print("\(token)")
        #endif
        let request = AF.request(url,
                                 method: .put,
                                 parameters: nil,
                                 encoding: JSONEncoding.default,
                                 headers: ["Authorization": "Bearer \(token)"])
        let dataTask = request.serializingDecodable(CartAddResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            #if DEBUG
            print("장바구니 increase 성공?")
            print("\(value.message)")
            #endif
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("장바구니 increase 실패")
            #endif
        }
    }
}
