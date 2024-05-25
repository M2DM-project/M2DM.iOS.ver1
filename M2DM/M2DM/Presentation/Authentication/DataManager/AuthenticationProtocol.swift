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
            //print("성공")
            return value
        case .failure(_):
            // 에러처리
            print("실패")
            return KakaoResponse(access_token: "error", refresh_token: "error")
        }
//        return AF.request(url,
//                          method: .get,
//                          parameters: nil,
//                          encoding: JSONEncoding.default)
//        .validate() // 유효성 검증
//        .publishDecodable(type: KakaoResponse.self) //디코딩
//        //에러처리?? 여기 잘 모르겠음..
//        .map { response in
//            response.mapError { error in
//                let backendError = response.data.flatMap { _ in }
//                return error
//            }
//        }
//        .eraseToAnyPublisher() // 최종 return 값을 AnyPublisher<DataResponse<KakaoResponse, Error>, Never>로 정리
    }
}
