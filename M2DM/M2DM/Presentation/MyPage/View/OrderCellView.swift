//
//  OrderCellView.swift
//  M2DM
//
//  Created by 최주리 on 11/6/24.
//

import SwiftUI

struct OrderCellView: View {
    var item: OrderThumbnail = OrderThumbnail(id: 0, name: "", price: 0, imgUrl: "", qty: 0)
    
    var body: some View {
        VStack {
            HStack {
                Image("shopImage\(item.id)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 80)
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("총 \(item.qty)건")
                        Spacer()
                        Text("주문상세>")
                    }
                    .font(.system(size: 14))
        
                    Spacer()
                    Text("\(item.name)")
                        .font(.system(size: 15))
                    Text("\(item.price)원")
                        .font(.system(size: 15))
                }
                .fontWeight(.bold)
            }
        }
        .listRowBackground(Color.clear)
        .padding()
    }
}

#Preview {
    OrderCellView()
}
