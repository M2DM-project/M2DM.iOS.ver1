//
//  MyInfo.swift
//  M2DM
//
//  Created by 최주리 on 9/6/24.
//

import Foundation

struct MyInfo: Decodable {
    let id: Int
    let nickname: String
    let email: String
    let password: String?
    let profileImgUrl: String
    let role: RoleEnum
    let streetAddr: String?
    let detailAddr: String?
    let zipcode: String?
}
