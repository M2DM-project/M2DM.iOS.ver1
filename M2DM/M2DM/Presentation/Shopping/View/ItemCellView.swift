//
//  ItemCellView.swift
//  M2DM
//
//  Created by 최주리 on 5/26/24.
//

import SwiftUI

struct ItemCellView: View {
    @EnvironmentObject private var shoppingViewModel: ShoppingViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    var product: Product
    
    //임시
    var isSuccessed: Bool = true
    
    var body: some View {
        if coordinator.shopType == .groupPurchase {
            VStack {
                Image("shopImage\(product.id)")
                    .resizable()
//                    .frame(width: 180)
                    .aspectRatio(contentMode: .fit)
                    
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(product.name)")
                            .font(.system(size: 15))
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                        Text("\(product.price)원")
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(isSuccessed ? .successGreen : .textLightGray)
                        .overlay {
                            Text(isSuccessed ? "진행중" : "실패")
                                .font(.system(size: 13))
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                        }
                        .frame(width: 50, height: 25)
                }
                .padding(.horizontal)
            }
        } else {
            VStack(alignment: .leading){
                Image(coordinator.shopType == .shop ? "shopImage\(product.id)" : "shImage\(product.id)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("\(product.name)")
                    .font(.system(size: 15))
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                Text("\(product.price)원")
                    .font(.system(size: 14))
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    ItemCellView(product: Product(id: 0, category: .init(id: 0, cateCode: "error", name: "error"), name: "error", price: 0, content: "error", imgUrl: "error", reviewCnt: 0, reviewStarAvg: 0))
}
