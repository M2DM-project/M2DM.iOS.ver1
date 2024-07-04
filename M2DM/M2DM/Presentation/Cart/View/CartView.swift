//
//  CartView.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject private var cartViewModel: CartViewModel
    @State private var deliveryFee: Int = 0
    
    var body: some View {
        ZStack {
            Color.background
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: 80)
                    HStack {
                        Button(action: {
                            cartViewModel.toggleAllSelectedItems()
                        }, label: {
                            HStack {
                                Image(systemName: cartViewModel.isAllSelected ? "checkmark.square.fill" : "square")
                                Text("전체선택")
                                    .foregroundStyle(.textGray)
                                    .fontWeight(.bold)
                            }
                        })

                        Spacer()
                        Text("상품삭제")
                            .foregroundStyle(.textLightGray)
                            .onTapGesture {
                                // TODO: 선택된 상품 삭제
                                Task {
                                    await cartViewModel.deleteCartItems()
                                    await cartViewModel.reloadCartItems()
                                }
                            }
                    }
                    .padding(.vertical)
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                        VStack {
                            ForEach(cartViewModel.cartItems) { item in
                                cartItemView(item)
                                Divider()
                            }
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                        VStack {
                            HStack {
                                Text("총 상품금액")
                                Spacer()
                                Text("\(cartViewModel.selectedCartItemsSum)원")
                                    .fontWeight(.bold)
                            }
                            .padding(.bottom, 5)
                            
                            HStack {
                                Text("배송비")
                                Spacer()
                                Text("\(deliveryFee)원")
                                    .fontWeight(.bold)
                            }
                            
                            HStack {
                                Text("결제 금액")
                                Spacer()
                                Text("\(cartViewModel.selectedCartItemsSum + deliveryFee)원")
                            }
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.vertical)
                        }
                        .padding()
                    }
                    .padding(.vertical)
                    
                    RoundRectangleButton(title: "구매하기", isDisabled: cartViewModel.selectedCartItemsId.count == 0)
                    
                    Spacer()
                        .frame(height: 100)
                }
                .scrollIndicators(.hidden)
                .padding()
            }
        }
        .ignoresSafeArea()
        .navigationTitle("장바구니")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task {
                await cartViewModel.firstLoadCartItems()
            }
        }
    }
}

fileprivate extension CartView {
    func cartItemView(_ item: CartItem) -> some View {
        HStack {
            Image(systemName: cartViewModel.selectedCartItemsId.contains(item.id) ? "checkmark.square.fill" : "square")
                .foregroundStyle(.accent)
                .onTapGesture {
                    cartViewModel.toggleSelectedItemsId(item: item)
                }
            
            Image("shopImage\(item.product.id)")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading) {
                Text("\(item.product.name)")
                    .fontWeight(.bold)
                HStack(spacing: 5) {
                    HStack {
                        Button(action: {
                            if item.count > 1 {
                                Task {
                                    await cartViewModel.decreaseCartItem(itemId: item.id)
                                    await cartViewModel.reloadCartItems()
                                }
                            }
                        }, label: {
                            Image(systemName: "minus.square.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.accent)
                        })
                        
                        Text("\(item.count)")
                            .font(.body)
                            .frame(width: 50)
                        
                        Button{
                            Task {
                                await cartViewModel.increaseCartItem(itemId: item.id)
                                await cartViewModel.reloadCartItems()
                            }
                        } label: {
                            Image(systemName: "plus.app.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.accent)
                        }
                        
                        Spacer()
                        
                        Text("\(item.price)원")
                            .font(.body)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    CartView()
}
