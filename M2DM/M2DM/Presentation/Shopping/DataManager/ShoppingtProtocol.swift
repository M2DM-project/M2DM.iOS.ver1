//
//  ProductProtocol.swift
//  M2DM
//
//  Created by 최주리 on 5/26/24.
//

import Foundation
import Alamofire

protocol ShoppingProtocol {
    func loadAllProduct() async -> ProductListResponse
    func loadProductBySort(category: String, sortOption: String) async -> ProductListResponse
    func loadSearchProduct(searchText: String) async -> ProductListResponse
}

final class Shopping {
    static let shared: ShoppingProtocol = Shopping()
}

extension Shopping: ShoppingProtocol {
    
    //MARK: - READ
    
    func loadAllProduct() async -> ProductListResponse {
        let url = "\(Constant.BASE_URL)/product/list"
        
        #if DEBUG
        print("\(url)")
        #endif
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default)
        let dataTask = request.serializingDecodable(ProductListResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            guard let _ = await dataTask.response.response else {return ProductListResponse(statusCode: 400, message: "client error", content: [])}
            return value
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("실패")
            #endif
            return ProductListResponse(statusCode: 400, message: "client error", content: [])
        }
    }
    
    func loadProductBySort(category: String, sortOption: String) async -> ProductListResponse {
        var url = "\(Constant.BASE_URL)/product/sort/category?sortBy=\(sortOption)&cateCode=\(category)"
        
        if sortOption == "" {
            url = "\(Constant.BASE_URL)/product/sort/category?cateCode=\(category)"
        } else if category == "" {
            url = "\(Constant.BASE_URL)/product/sort/category?sortBy=\(sortOption)"
        }
        
        #if DEBUG
        print("\(url)")
        #endif
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default)
        let dataTask = request.serializingDecodable(ProductListResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            guard let _ = await dataTask.response.response else {return ProductListResponse(statusCode: 400, message: "client error", content: [])}
            return value
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("실패")
            #endif
            return ProductListResponse(statusCode: 400, message: "client error", content: [])
        }
    }
    
    func loadSearchProduct(searchText: String) async -> ProductListResponse {
        let url = "\(Constant.BASE_URL)/product/search/{keyword}?keyword=\(searchText)"
        
        #if DEBUG
        print("\(url)")
        #endif
        let request = AF.request(url,
                                 method: .get,
                                 parameters: nil,
                                 encoding: JSONEncoding.default)
        let dataTask = request.serializingDecodable(ProductListResponse.self)
        
        switch await dataTask.result {
            
        case .success(let value):
            guard let _ = await dataTask.response.response else {return ProductListResponse(statusCode: 400, message: "client error", content: [])}
            return value
            
        case .failure(_):
            // TODO: 에러 처리
            #if DEBUG
            print("실패")
            #endif
            return ProductListResponse(statusCode: 400, message: "client error", content: [])
        }
    }
}
