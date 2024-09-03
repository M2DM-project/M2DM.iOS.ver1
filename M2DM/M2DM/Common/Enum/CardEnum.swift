//
//  CardEnum.swift
//  M2DM
//
//  Created by 최주리 on 9/3/24.
//

import Foundation

enum CardEnum: CaseIterable, Codable {
    case KB국민카드
    case 신한카드
    case 삼성카드
    case 비씨카드
    case NH농협카드
    case 현대카드
    case 롯데카드
    case 하나카드
    case 카카오뱅크카드
    case 케이뱅크카드
    case 우리카드
    case 씨티카드
    case 신협카드
    case 수협카드
    case 우체국카드
    case 전북카드
    case 제주카드
    case KDB산업은행카드
    case 광주카드

    var description: String {
        String(describing: self)
    }
}
