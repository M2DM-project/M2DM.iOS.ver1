//
//  SearchResultView.swift
//  M2DM
//
//  Created by 최주리 on 6/15/24.
//

import SwiftUI

struct SearchResultView: View {
    @EnvironmentObject private var shoppingViewModel: ShoppingViewModel
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
                    ForEach(shoppingViewModel.productList) { item in
                        ItemCellView(product: item)
                    }
                }
            }
        }
        .toolbarRole(.editor)
        .navigationTitle(coordinator.searchText)
        .onAppear {
            Task {
                await shoppingViewModel.loadSearchProductList(searchText: coordinator.searchText)
            }
        }
    }
}

#Preview {
    SearchResultView()
}
