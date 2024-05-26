//
//  ShopView.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import SwiftUI

struct ShopView: View {
    @EnvironmentObject private var shoppingViewModel: ShoppingViewModel
    
    //그리드 형식 2개
    let layout = [
        GridItem(.flexible(maximum: 80), spacing: 100),
        GridItem(.flexible(maximum: 80), spacing: 100),
    ]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(CategoryEnum.allCases, id: \.self) { item in
                        VStack {
                            Image("\(item)")
                                .resizable()
                                .scaledToFit()
                                .clipShape(.circle)
                                .frame(width: 50, height: 50)
                            Text("\(item.title)")
                                .foregroundStyle(shoppingViewModel.selectedCategory == item ? .accent : .textGray)
                        }
                        .onTapGesture {
                            // 카테고리 필터링 api
                            Task {
                                await shoppingViewModel.loadSortedProductList(category: item, sortOption: shoppingViewModel.selectedSortOption)
                            }
                        }
                    }
                }
            }
            
            HStack {
                Spacer()
                Menu {
                    ForEach(SortOptionEnum.allCases, id: \.self) { option in
                        Button(action: {
                            // 정렬 api
                            Task {
                                await shoppingViewModel.loadSortedProductList(category: shoppingViewModel.selectedCategory, sortOption: option)
                            }
                        }, label: {
                            Text("\(option.title)")
                        })
                    }
                } label: {
                    Label("\(shoppingViewModel.selectedSortOption.title)", systemImage: "chevron.down")
                        .font(.system(size: 15))
                }
                .frame(width: 100, height: 35)
            }
            
            ScrollView {
                LazyVGrid (columns: layout) {
                    ForEach(shoppingViewModel.productList) { item in
                        ItemCellView(product: item)
                    }
                }
            }
        }
        .onAppear {
            Task {
                await shoppingViewModel.loadAllProduct()
            }
        }
    }
}

#Preview {
    ShopView()
}
