//
//  MenuView.swift
//  M2DM
//
//  Created by 최주리 on 5/26/24.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject private var coordinator: Coordinator
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 30) {
                Spacer()
                    .frame(height: 100)
                Text("상품 구매")
                    .onTapGesture {
                        //TODO: MAIN Tab으로 이동하도록 해야 함
                        coordinator.selectedTab = .shopping
                    }
                Text("중고 거래")
                    .onTapGesture {
                        coordinator.appendPath(.shopListView)
                        coordinator.shopType = .secondhand
                    }
                Text("공동 구매")
                    .onTapGesture {
                        coordinator.appendPath(.groupPurchaseListView)
                        coordinator.shopType = .groupPurchase
                    }
                Text("자주 묻는 질문")
                Spacer()
            }
            .font(.system(size: 20))
            .foregroundStyle(.textGray)
            .padding(.leading, 40)
            
            Spacer()
        }
        .background(Color.background)
        .navigationTitle("메뉴")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
    }
}
