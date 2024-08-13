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
        ZStack {
            Color.background
            VStack {
                Spacer()
                    .frame(height: 100)
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
                                .frame(width: 200, height: 200)
                                .onTapGesture {
                                    Task {
                                        await shoppingViewModel.loadOneProduct(id: item.id)
                                        coordinator.appendPath(.shopDetailView)
                                    }
                                }
                        }
                    }
                    Spacer()
                        .frame(height: 200)
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle(coordinator.shopType.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.editor)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        coordinator.appendPath(.searchView)
                        coordinator.fromTab = .shopListView
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                    })
                }
            }
            // TODO: onappear 할 때마다 불러오는 로직이 아니라 처음만 불러오고 refresh하면 불러오는 걸로 고치기
            .onAppear {
                print("\(coordinator.selectedTab)")
                
                Task {
                    await shoppingViewModel.loadAllProduct()
                }
            }
        }
        .ignoresSafeArea()
    }
}
