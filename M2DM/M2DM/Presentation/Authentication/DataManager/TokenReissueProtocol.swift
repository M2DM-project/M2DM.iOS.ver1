//
//  TokenReissueProtocol.swift
//  M2DM
//
//  Created by 최주리 on 7/9/24.
//

import Alamofire
import Foundation

protocol TokenReissueProtocol {
    func reissue() async -> KakaoResponse
}

class TokenReissue {
    static let shared: TokenReissueProtocol = TokenReissue()
}

extension TokenReissue: TokenReissueProtocol {
    func reissue() async -> KakaoResponse {
        let url = "\(Constant.BASE_URL)/reissue"
        let token = KeyChain.read(key: "refresh_token") ?? ""
        
        #if DEBUG
        print("url: \(url)")
        print("token: \(token)")
        
        #endif
        let request = AF.request(url,
                                 method: .post,
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
            print("카카오 토큰 받아오기 실패")
            #endif
            return KakaoResponse(access_token: "error", refresh_token: "error")
        }
    }
}
