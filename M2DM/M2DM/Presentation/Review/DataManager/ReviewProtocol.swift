//
//  ReviewProtocol.swift
//  M2DM
//
//  Created by 최주리 on 6/19/24.
//

import Alamofire
import Foundation

protocol ReviewProtocol {
    func addReview(id: Int, _ parameters: ReviewRequest) async
}

final class ReviewClass {
    static let shared: ReviewProtocol = ReviewClass()
}

extension ReviewClass: ReviewProtocol {
    
    @MainActor
    func addReview(id: Int, _ parameters: ReviewRequest) async {
        let url = "\(Constant.BASE_URL)/review/\(id)/add"
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
        let dataTask = request.serializingDecodable(ReviewResponse.self)
        
        switch await dataTask.result {
            
        case .success(_):
            guard let _ = await dataTask.response.response else {return}
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("리뷰 등록 실패")
            #endif
        }
    }
}
