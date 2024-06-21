//
//  ShopDetailView.swift
//  M2DM
//
//  Created by 최주리 on 6/17/24.
//

import SwiftUI

struct ShopDetailView: View {
    @EnvironmentObject private var shoppingViewModel: ShoppingViewModel
    @StateObject private var reviewViewModel = ReviewViewModel()
    
    @State private var reviewText: String = ""
    @State private var reviewRating: Int = 0
    
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
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                        VStack(spacing: 10) {
                            HStack {
                                Spacer()
                                
                                Text("후기  \(shoppingViewModel.product.reviewCnt)")
                                    .foregroundStyle(.textGray)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            
                            VStack {
                                HStack {
                                    StarRatingView(rating: $reviewRating, fontSize: 12, isWriting: true)
                                    TextEditor(text: $reviewText)
                                        .frame(height: 50)
                                        .font(.system(size: 13))
                                        .border(.textGray, width: 0.5)
                                }
                                .padding(.bottom, 5)
                                HStack {
                                    Spacer()
                                    RoundRectangleButton(cornerRadius: 5, height: 24, fontSize: 13, title: "작성완료")
                                        .frame(width: 80)
                                }
                            }
                            
                            VStack {
                                HStack {
                                    Menu {
                                        ForEach(ReviewSortOptionEnum.allCases, id: \.self) { option in
                                            Button(action: {
                                                Task {
                                                    // TODO: 리뷰 정렬
                                                    await reviewViewModel.loadSortedReviewList(sortOption: option)
                                                }
                                            }, label: {
                                                Text("\(option.title)")
                                            })
                                        }
                                    } label: {
                                        Label("\(reviewViewModel.selectedSortOption.title)", systemImage: "chevron.down")
                                            .font(.system(size: 15))
                                    }
                                    .frame(width: 100, height: 35)
                                    Spacer()
                                }
                                
                                Divider()
                                    .background(.textGray)
                                
                                ForEach(shoppingViewModel.product.reviewList) { item in
                                    VStack {
                                        ReviewCell(rating: item.star, reviewText: item.content, date: item.date)
                                        Divider()
                                    }
                                    .padding(.vertical, 5)
                                }
                            }
                        }
                        .padding()
                    }
                    .padding(.bottom)
                }
                .scrollIndicators(.hidden)
                .padding()
                .padding(.bottom, 80)
            }
            .toolbarRole(.editor)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ShopDetailView()
}
