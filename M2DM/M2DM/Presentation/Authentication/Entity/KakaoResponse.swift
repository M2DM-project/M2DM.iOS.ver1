//
//  KakaoResponse.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import Foundation

struct KakaoResponse: Decodable {
    var access_token: String
    var refresh_token: String
}

