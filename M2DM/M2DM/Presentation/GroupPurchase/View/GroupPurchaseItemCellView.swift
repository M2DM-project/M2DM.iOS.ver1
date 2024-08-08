//
//  ItemCellView.swift
//  M2DM
//
//  Created by 최주리 on 5/26/24.
//

import SwiftUI

struct GroupPurchaseItemCellView: View {
    @EnvironmentObject private var groupPurchaseViewModel: ShoppingViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    var product: GroupPurchase
    
    var body: some View {
        VStack {
            Image("gpImage\(product.id)")
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
                    .foregroundStyle(product.state != .FAIL ? .successGreen : .textLightGray)
                    .overlay {
                        Text(product.state != .FAIL ? "진행중" : "실패")
                            .font(.system(size: 13))
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    }
                    .frame(width: 50, height: 25)
            }
            .padding(.horizontal)
        }
    }
}
