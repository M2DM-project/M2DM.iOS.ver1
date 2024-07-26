//
//  GroupPurchaseView.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import SwiftUI

struct GroupPurchaseDetailView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var shoppingViewModel: ShoppingViewModel
    @StateObject private var reviewViewModel = ReviewViewModel()
    @EnvironmentObject private var cartViewModel: CartViewModel
    
    @State private var reviewText: String = ""
    @State private var reviewRating: Int = 0
    
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                HStack {
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
                
                //MARK: - 공동구매 정보 (기간, 수량)
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("진행 기간")
                            Text("남은 기간")
                            Text("현재 수량 / 목표 수량")
                            Text("목표까지 남은 수량")
                        }
                        .foregroundStyle(.textGray)
                        .fontWeight(.bold)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 10) {
                            Text("23/11/11 ~ 23/12/12")
                            Text("5일")
                            Text("30개 / 40개")
                            Text("10개")
                        }
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                    }
                    .padding()
                }
                .padding(.bottom)
                
                RoundRectangleButton(title: "참여하기") {
                    //TODO: 공동구매 참여
                }
            }
            .scrollIndicators(.hidden)
            .padding()
            .padding(.bottom, 30)
        }
        .background(Color(.background))
        .toolbarRole(.editor)
    }
}

#Preview {
    GroupPurchaseDetailView()
}
