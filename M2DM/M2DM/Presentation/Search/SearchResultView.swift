//
//  SearchResultView.swift
//  M2DM
//
//  Created by 최주리 on 6/15/24.
//

import SwiftUI

struct SearchResultView: View {
    @EnvironmentObject private var shoppingViewModel: ShoppingViewModel
    @EnvironmentObject private var groupPurchaseViewModel: GroupPurchaseViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    //그리드 형식 2개
    let layout = [
        GridItem(.flexible(maximum: 80), spacing: 100),
        GridItem(.flexible(maximum: 80), spacing: 100),
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                Spacer()
                    .padding(.top, 30)
                LazyVGrid (columns: layout) {
                    if coordinator.fromTab == .shopListView {
                        ForEach(shoppingViewModel.productList) { item in
                            ItemCellView(product: item)
                                .frame(width: 200, height: 200)
                                .onTapGesture {
                                    Task {
                                        await shoppingViewModel.loadOneProduct(id: item.id)
                                        coordinator.appendPath(.shopDetailView)
                                    }
                                }
                        }
                    } else if coordinator.fromTab == .groupPurchaseListView {
                        ForEach(groupPurchaseViewModel.gpList) { item in
                            GroupPurchaseItemCellView(product: item)
                                .frame(width: 200, height: 200)
                                .onTapGesture {
                                    Task {
                                        coordinator.appendPath(.groupPurchaseDetailView)
                                    }
                                }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .toolbarRole(.editor)
        .navigationTitle(coordinator.searchText)
        .onAppear {
            Task {
                if coordinator.fromTab == .shopListView {
                    await shoppingViewModel.loadSearchProductList(searchText: coordinator.searchText)
                } else if coordinator.fromTab == .groupPurchaseListView {
                    await groupPurchaseViewModel.loadSearchGPProductList(searchText: coordinator.searchText)
                }
            }
        }
        .background(Color.background)
    }
}

#Preview {
    SearchResultView()
}
