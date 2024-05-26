//
//  File.swift
//  M2DM
//
//  Created by 최주리 on 5/26/24.
//

import Foundation

enum CategoryEnum: CaseIterable, Codable {
    case GEN
    case FUR
    case FAB
    case AD
    case STO
    case DEC
    case LIT
    case PLA
    
    var title: String {
        switch self {
        case .GEN: "전체"
        case .FUR: "가구"
        case .FAB: "패브릭"
        case .AD: "가전/디지털"
        case .STO: "수납/정리"
        case .DEC: "소품"
        case .LIT: "조명"
        case .PLA: "식물"
        }
    }
    
    var description: String {
        switch self {
        case .GEN: "gen"
        case .FUR: "fur"
        case .FAB: "fab"
        case .AD: "ad"
        case .STO: "sto"
        case .DEC: "dec"
        case .LIT: "lit"
        case .PLA: "pla"
        }
    }
}
