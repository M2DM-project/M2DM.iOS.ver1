//
//  MyPageOrderListView.swift
//  M2DM
//
//  Created by 최주리 on 10/30/24.
//

import SwiftUI

struct MyPageOrderListView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var myPageViewModel: MyPageViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(myPageViewModel.orders) { item in
                    OrderCellView(item: item)
                        .onTapGesture {
                            //TODO: 주문 상세 view
                            coordinator.appendPath(.orderDetailView)
                        }
                }
            }
            .background(Color.background)
            .scrollContentBackground(.hidden)
        }
        .background(Color.background)
    }
}
