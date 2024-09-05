//
//  ShopDetailView.swift
//  M2DM
//
//  Created by 최주리 on 6/17/24.
//

import SwiftUI

struct ShopDetailView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var shoppingViewModel: ShoppingViewModel
    @StateObject private var reviewViewModel = ReviewViewModel()
    @EnvironmentObject private var cartViewModel: CartViewModel
    
    @State private var reviewText: String = ""
    @State private var reviewRating: Int = 0
    @State private var isShowing: Bool = false
    
    var body: some View {
        ZStack {
            Color.background
            VStack(alignment: .leading) {
                ScrollView {
                    Rectangle()
                        .frame(height: 70)
                        .foregroundStyle(.clear)
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
                    
                    //MARK: - 장바구니, 구매하기
                    
                    HStack(spacing: 20) {
                        RoundRectangleButton(title: "장바구니") {
                            Task {
                                await cartViewModel.addCartItem(prodId: shoppingViewModel.product.id)
                                // TODO: 로딩 뷰 만들어서 넣기
                                coordinator.pop()
                            }
                        }
                        
                        RoundRectangleButton(title: "구매하기") {
                            isShowing = true
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
                            
                            // TODO: 구매한 상품만 리뷰 작성 가능하도록 해야 함!
                            
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
                                    RoundRectangleButton(cornerRadius: 5, height: 24, fontSize: 13, title: "작성완료") {
                                        Task {
                                            await reviewViewModel.addReview(id: shoppingViewModel.product.id, star: reviewRating, content: reviewText)
                                            await shoppingViewModel.loadOneProduct(id: shoppingViewModel.product.id)
                                            reviewViewModel.loadAllReviewList()
                                        }
                                    }
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
                                
                                ForEach(reviewViewModel.reviewList) { item in
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
            .sheet(isPresented: $isShowing, content: {
                ShopBottomSheet(item: shoppingViewModel.product, isShowing: $isShowing)
                    .presentationDetents([.medium])
            })
        }
        .ignoresSafeArea()
        .onAppear {
            Task {
                reviewViewModel.getProduct(product: shoppingViewModel.product)
                reviewViewModel.loadAllReviewList()
            }
        }
    }
}

#Preview {
    ShopDetailView()
}
