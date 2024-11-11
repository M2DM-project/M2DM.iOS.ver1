//
//  MyPageProtocol.swift
//  M2DM
//
//  Created by 최주리 on 9/6/24.
//

import Alamofire
import Foundation

protocol MyPageProtocol {
    func loadMyInfo() async -> MyPageResponse
    func laodOrder() async -> MyOrderResponse
}

final class MyPageClass {
    static let shared: MyPageProtocol = MyPageClass()
}

extension MyPageClass: MyPageProtocol {
    
    func loadMyInfo() async -> MyPageResponse {
        let url = "\(Constant.BASE_URL)/mypage"
        let token = KeyChain.read(key: "access_token") ?? ""
        
        #if DEBUG
        print("\(url)")
        #endif
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default,
                                 headers: ["Authorization": "Bearer \(token)"])
        let dataTask = request.serializingDecodable(MyPageResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            guard let _ = await dataTask.response.response else {return MyPageResponse(statusCode: 400, message: "client error", content: MyInfo(id: 0, nickname: "", email: "", password: "", profileImgUrl: "", role: .ADMIN, streetAddr: "", detailAddr: "", zipcode: ""))}
            
            #if DEBUG
            print("\(value.content.nickname)")
            #endif
            
            return value
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("사용자 정보 불러오기 실패")
            #endif
            return MyPageResponse(statusCode: 400, message: "client error", content: MyInfo(id: 0, nickname: "", email: "", password: "", profileImgUrl: "", role: .ADMIN, streetAddr: "", detailAddr: "", zipcode: ""))
        }
    }
    
    func laodOrder() async -> MyOrderResponse {
        let url = "\(Constant.BASE_URL)/mypage/order"
        let token = KeyChain.read(key: "access_token") ?? ""
        
        #if DEBUG
        print("\(url)")
        #endif
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default,
                                 headers: ["Authorization": "Bearer \(token)"])
        
        let dataTask = request.serializingDecodable(MyOrderResponse.self)
        print("\(await dataTask.result)")
        dump(await dataTask.result)
        switch await dataTask.result {
            
        case .success(let value):
            guard let _ = await dataTask.response.response else {return MyOrderResponse(statusCode: 0, message: "", content: [])}
            
            return value
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("주문 정보 불러오기 실패")
            #endif
            return MyOrderResponse(statusCode: 0, message: "", content: [])
        }
    }
}
