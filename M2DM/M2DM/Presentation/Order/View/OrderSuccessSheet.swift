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
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(.accent)
                .font(.system(size: 40))
            
            Text("주문이 완료되었습니다!")
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            RoundRectangleButton(title: "쇼핑 계속하기") {
                if coordinator.selectedTab == .cart {
                    coordinator.pop(1)
                } else if coordinator.selectedTab == .shopping {
                    coordinator.pop(2)
                } else if coordinator.selectedTab == .menu {
                    //TODO: 중고거래일 때 pop 처리하기
                    coordinator.pop(2)
                }
            }
            .frame(width: 200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    OrderSuccessSheet()
}
