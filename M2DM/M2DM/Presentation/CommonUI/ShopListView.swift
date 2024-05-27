//
//  ShopListView.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import SwiftUI

struct ShopListView: View {
    @EnvironmentObject private var shoppingViewModel: ShoppingViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
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
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    coordinator.appendPath(.searchView)
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                })
            }
        }
        .onAppear {
            Task {
                await shoppingViewModel.loadAllProduct()
            }
        }
    }
}
