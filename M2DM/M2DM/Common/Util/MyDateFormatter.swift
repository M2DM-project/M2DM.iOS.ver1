//
//  DateFormatter.swift
//  M2DM
//
//  Created by 최주리 on 6/21/24.
//

import Foundation

struct MyDateFormatter {
    static let shared = MyDateFormatter()
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return dateFormatter
    }
    
    func dateToString(from date: Date) -> String {
        dateFormatter.string(from: date)
    }
}
