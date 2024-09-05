//
//  OrderProtocol.swift
//  M2DM
//
//  Created by 최주리 on 9/5/24.
//

import Alamofire
import Foundation

protocol OrderProtocol {
    func orderProduct(_ id: Int, _ qty: Int, _ parameters: OrderRequest) async
    func orderCart(_ parameters: CartOrderRequest) async
}

final class OrderClass {
    static let shared: OrderProtocol = OrderClass()
}

extension OrderClass: OrderProtocol {
    
    func orderProduct(_ id: Int, _ qty: Int, _ parameters: OrderRequest) async {
        let url = "\(Constant.BASE_URL)/order/product/\(id)/\(qty)"
        let token = KeyChain.read(key: "access_token") ?? ""
        
        #if DEBUG
        print("url: \(url)")
        print("token: \(token)")
        #endif
        
        let request = AF.request(url,
                                 method: .post,
                                 parameters: parameters,
                                 encoder: JSONParameterEncoder(),
                                 headers: ["Authorization": "Bearer \(token)"])
        let dataTask = request.serializingDecodable(OrderResponse.self)
        
        switch await dataTask.result {
            
        case .success(_):
            guard let _ = await dataTask.response.response else {return}
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("상품 구매 실패")
            #endif
            //TODO: reissue api 해보기..
        }
    }
    
    func orderCart(_ parameters: CartOrderRequest) async {
        let url = "\(Constant.BASE_URL)/order/cart/add"
        let token = KeyChain.read(key: "access_token") ?? ""
        
        #if DEBUG
        print("url: \(url)")
        print("token: \(token)")
        #endif
        
        let request = AF.request(url,
                                 method: .post,
                                 parameters: parameters,
                                 encoder: JSONParameterEncoder(),
                                 headers: ["Authorization": "Bearer \(token)"])
        let dataTask = request.serializingDecodable(OrderResponse.self)
        
        switch await dataTask.result {
            
        case .success(_):
            guard let _ = await dataTask.response.response else {return}
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("장바구니 상품 구매 실패")
            #endif
            //TODO: reissue api 해보기..
        }
    }
}
