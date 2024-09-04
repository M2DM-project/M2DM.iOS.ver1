//
//  OrderSuccessSheet.swift
//  M2DM
//
//  Created by 최주리 on 9/3/24.
//

import SwiftUI

struct OrderSuccessSheet: View {
    @EnvironmentObject private var coordinator: Coordinator
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(.accent)
            
            Text("주문이 완료되었습니다!")
            
            RoundRectangleButton(title: "쇼핑 계속하기") {
                if coordinator.selectedTab == .cart {
                    coordinator.pop(2)
                } else if coordinator.selectedTab == .shopping {
                    coordinator.pop(3)
                } else if coordinator.selectedTab == .menu {
                    //TODO: 중고거래일 때 pop 처리하기
                    coordinator.pop(3)
                }
            }
            .frame(width: 200)
        }
    }
}

#Preview {
    OrderSuccessSheet()
}
