//
//  CartSuccessView.swift
//  M2DM
//
//  Created by 최주리 on 9/5/24.
//

import SwiftUI

struct CartSuccessView: View {
    @EnvironmentObject private var coordinator: Coordinator
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "cart.fill")
                .foregroundStyle(.accent)
                .font(.system(size: 40))
            
            Text("장바구니에 상품이 성공적으로 담겼습니다!")
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            RoundRectangleButton(title: "쇼핑 계속하기") {
                coordinator.pop()
            }
            .frame(width: 200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
