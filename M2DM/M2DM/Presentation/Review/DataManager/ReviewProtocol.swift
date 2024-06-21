//
//  ReviewProtocol.swift
//  M2DM
//
//  Created by 최주리 on 6/19/24.
//

import Alamofire
import Foundation

protocol ReviewProtocol {
    
}

final class ReviewClass {
    static let shared: ReviewProtocol = ReviewClass()
}

extension ReviewClass: ReviewProtocol {
    
}
