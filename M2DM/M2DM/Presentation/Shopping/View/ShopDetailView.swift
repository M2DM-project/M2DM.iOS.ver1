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
        VStack(alignment: .leading) {
            ScrollView {
                HStack {
                    Image(systemName: "chevron.right")
                    Text("\(shoppingViewModel.product.cateCode)")
                    Spacer()
                }
                .foregroundStyle(.textGray)
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                    Image("\(shoppingViewModel.product.imgUrl)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(height: 300)
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                    VStack(alignment: .leading) {
                        Text("\(shoppingViewModel.product.name)")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("\(shoppingViewModel.product.price)원")
                            .font(.title3)
                    }
                }
                .padding()
                
                //MARK: - 장바구니, 구매하기, 찜 버튼
                
                HStack {
                    // 버튼 2개랑 하트
                }
                
                //MARK: - 상품정보
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                    VStack {
                        HStack {
                            Spacer()
                            Text("상품정보")
                                .foregroundStyle(.textGray)
                            Spacer()
                        }
                        Text("\(shoppingViewModel.product.content)")
                    }
                }
                //MARK: - 후기
                
                //MARK: - 비슷한 상품
            }
            .padding()
        }
    }
}

#Preview {
    ShopDetailView()
}
