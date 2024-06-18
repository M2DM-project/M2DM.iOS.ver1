//
//  ShopDetailView.swift
//  M2DM
//
//  Created by 최주리 on 6/17/24.
//

import SwiftUI

struct ShopDetailView: View {
    @EnvironmentObject private var shoppingViewModel: ShoppingViewModel
    
    var body: some View {
        ZStack {
            Color.background
            VStack(alignment: .leading) {
                ScrollView {
                    Rectangle()
                        .frame(height: 70)
                        .foregroundStyle(.clear)
                    HStack {
//                        Image(systemName: "chevron.right")
                        Text("\(shoppingViewModel.product.cateCode)")
                        Spacer()
                    }
                    .foregroundStyle(.textGray)
                    .fontWeight(.bold)
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                        Image("shopImage\(shoppingViewModel.product.id)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(height: 300)
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("\(shoppingViewModel.product.name)")
                                    .font(.system(size: 23))
                                    .fontWeight(.bold)
                                Text("\(shoppingViewModel.product.price)원")
                                    .font(.system(size: 16))
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    .padding(.vertical)
                    
                    //MARK: - 장바구니, 구매하기
                    
                    HStack(spacing: 20) {
                        // 버튼 2개랑 하트
                        RoundRectangleButton(title: "장바구니") {
                            
                        }
                        
                        RoundRectangleButton(title: "구매하기") {
                            
                        }
                    }
                    .padding(.bottom)
                    
                    //MARK: - 상품정보
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                        VStack(spacing: 10) {
                            HStack {
                                Spacer()
                                Text("상품정보")
                                    .foregroundStyle(.textGray)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            Text("\(shoppingViewModel.product.content)")
                        }
                        .padding()
                    }
                    .padding(.bottom)
                    
                    //MARK: - 후기
                    
                    //MARK: - 비슷한 상품
                }
                .padding()
            }
            .toolbarRole(.editor)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ShopDetailView()
}
