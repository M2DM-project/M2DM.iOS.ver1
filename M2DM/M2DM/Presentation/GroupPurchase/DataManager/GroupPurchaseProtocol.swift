//
//  GroupPurchaseProtocol.swift
//  M2DM
//
//  Created by 최주리 on 8/1/24.
//

import Alamofire
import Foundation

protocol GroupPurchaseProtocol {
    func loadAllGPList() async -> GroupPurchaseResponse
    func loadProductBySort(category: String, sortOption: String) async -> GroupPurchaseResponse
    func loadSearchGPProduct(searchText: String) async -> GroupPurchaseResponse
}

final class GroupPurchaseClass {
    static let shared: GroupPurchaseProtocol = GroupPurchaseClass()
}

extension GroupPurchaseClass: GroupPurchaseProtocol {
    
    func loadAllGPList() async -> GroupPurchaseResponse {
        let url = "\(Constant.BASE_URL)/gp/list"
        
        #if DEBUG
        print("\(url)")
        #endif
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default)
        let dataTask = request.serializingDecodable(GroupPurchaseResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            guard let _ = await dataTask.response.response else {return GroupPurchaseResponse(statusCode: 400, message: "client error", content: [])}
            return value
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("전체 상품 불러오기 실패")
            #endif
            return GroupPurchaseResponse(statusCode: 400, message: "client error", content: [])
        }
    }
    
    func loadProductBySort(category: String, sortOption: String) async -> GroupPurchaseResponse {
        var url = "\(Constant.BASE_URL)/gp/sort/category?sortBy=\(sortOption)&cateCode=\(category)"
        
        if sortOption == "" {
            url = "\(Constant.BASE_URL)/gp/sort/category?cateCode=\(category)"
        } else if category == "GEN" {
            url = "\(Constant.BASE_URL)/gp/sort/category?sortBy=\(sortOption)"
        }
        
        #if DEBUG
        print("\(url)")
        #endif
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default)
        let dataTask = request.serializingDecodable(GroupPurchaseResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            guard let _ = await dataTask.response.response else {return GroupPurchaseResponse(statusCode: 400, message: "client error", content: [])}
            return value
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("상품 정렬 실패")
            #endif
            return GroupPurchaseResponse(statusCode: 400, message: "client error", content: [])
        }
    }
    
    
    func loadSearchGPProduct(searchText: String) async -> GroupPurchaseResponse {
        let url = "\(Constant.BASE_URL)/gp/search/{keyword}?keyword=\(searchText)"
        
        #if DEBUG
        print("\(url)")
        #endif
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default)
        let dataTask = request.serializingDecodable(GroupPurchaseResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            guard let _ = await dataTask.response.response else {return GroupPurchaseResponse(statusCode: 400, message: "client error", content: [])}
            return value
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("상품 검색 실패")
            #endif
            return GroupPurchaseResponse(statusCode: 400, message: "client error", content: [])
        }
    }
}
