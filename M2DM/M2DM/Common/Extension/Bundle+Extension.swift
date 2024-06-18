//
//  Bundle+Extension.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import Foundation

extension Bundle {
    var kakaoAppKey: String? {
        return infoDictionary?["KAKAO_APP_KEY"] as? String
    }
}
