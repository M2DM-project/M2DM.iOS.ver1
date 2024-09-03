//
//  GroupPurchaseView.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import SwiftUI

struct GroupPurchaseDetailView: View {
    @EnvironmentObject private var groupPurchaseViewModel: GroupPurchaseViewModel
    @EnvironmentObject private var coordinator: Coordinator
    @State private var isShowing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                    Image("gpImage\(groupPurchaseViewModel.product.id)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(height: 300)
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("\(groupPurchaseViewModel.product.name)")
                                .font(.system(size: 23))
                                .fontWeight(.bold)
                            Text("\(groupPurchaseViewModel.product.price)원")
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
                        Text("\(groupPurchaseViewModel.product.content)")
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
                            Text("현재 수량 / 목표 수량")
                            Text("목표까지 남은 수량")
                        }
                        .foregroundStyle(.textGray)
                        .fontWeight(.bold)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 10) {
                            Text("\(groupPurchaseViewModel.product.start) ~ \(groupPurchaseViewModel.product.end)")
                            Text("\(groupPurchaseViewModel.product.nowQty)개 / \(groupPurchaseViewModel.product.goalQty)개")
                            Text("\(groupPurchaseViewModel.product.goalQty - groupPurchaseViewModel.product.nowQty)개")
                        }
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                    }
                    .padding()
                }
                .padding(.bottom)
                
                RoundRectangleButton(title: "참여하기", isDisabled: groupPurchaseViewModel.product.state != .ONGOING && groupPurchaseViewModel.product.state != .ACHIEVED) {
                    //TODO: 공동구매 참여
                    isShowing = true
                }
            }
            .scrollIndicators(.hidden)
            .padding()
            .padding(.bottom, 30)
        }
        .background(Color(.background))
        .toolbarRole(.editor)
        .sheet(isPresented: $isShowing) {
            GrouppurchaseBottomSheet(item: groupPurchaseViewModel.product, isShowing: $isShowing)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    GroupPurchaseDetailView()
}
