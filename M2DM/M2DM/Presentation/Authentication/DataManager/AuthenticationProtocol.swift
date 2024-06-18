//
//  AuthenticationProtocol.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import Alamofire
import Combine
import Foundation

protocol AuthenticationProtocol {
    func checkKakao(_ token: String) async -> KakaoResponse
    func withdrawal() async
}

class Authentication {
    static let shared: AuthenticationProtocol = Authentication()
}

extension Authentication: AuthenticationProtocol {
    
    func checkKakao(_ token: String) async -> KakaoResponse {
        
        let url = "\(Constant.BASE_URL)/kakao/ios?access_token=\(token)"
        
        #if DEBUG
        print("url: \(url)")
        print("token: \(token)")
        
        #endif
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default)
        let dataTask = request.serializingDecodable(KakaoResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            guard let _ = await dataTask.response.response else {return KakaoResponse(access_token: "error", refresh_token: "error")}
            return value
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("실패")
            #endif
            return KakaoResponse(access_token: "error", refresh_token: "error")
        }
    }
    
    func withdrawal() async {
        let url = "\(Constant.BASE_URL)/withdrawal"
        let token = KeyChain.read(key: "access_token") ?? ""
        
        #if DEBUG
        print("url: \(url)")
        #endif
        let request = AF.request(url,
                                 method: .delete,
                                 parameters: nil,
                                 encoding: JSONEncoding.default,
                                 headers: ["Authorization": "Bearer \(token)"])
        let dataTask = request.serializingDecodable(KakaoResponse.self)
        
        switch await dataTask.result {
            
        case .success(_):
            guard let _ = await dataTask.response.response else {return}
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("실패")
            #endif
        }
    }
}
