//
//  ItemCellView.swift
//  M2DM
//
//  Created by 최주리 on 5/26/24.
//

import SwiftUI

struct ItemCellView: View {
    @EnvironmentObject private var shoppingViewModel: ShoppingViewModel
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading){
            Image("shopImage\(product.id)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.frame(width: 150, height: 150)
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

#Preview {
    ItemCellView(product: Product(id: 0, category: .init(id: 0, cateCode: "error", name: "error"), name: "error", price: 0, content: "error", imgUrl: "error", reviewCnt: 0, reviewStarAvg: 0))
}
