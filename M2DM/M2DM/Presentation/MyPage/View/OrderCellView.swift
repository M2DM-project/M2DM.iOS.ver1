//
//  OrderCellView.swift
//  M2DM
//
//  Created by 최주리 on 11/6/24.
//

import SwiftUI

struct OrderCellView: View {
    var item: Order = Order(id: 0, name: "최주리", contact: "010-1111-1111", email: "jj@naver.com", zipcode: "", streetAddr: "", detailAddr: "", price: 98000, qty: 1, product: Product(id: 0, category: Category(id: 0, cateCode: "", name: ""), name: "", price: 98000, content: "", imgUrl: "", reviewCnt: 0, reviewStarAvg: 5), groupPurchase: GroupPurchase(id: 0, name: "", price: 0, content: "", state: .ACHIEVED, imgUrl: "", maxQty: 0, nowQty: 0, goalQty: 0, start: "", end: "", category: Category(id: 0, cateCode: "", name: "")), cartItems: [])
    
    var body: some View {
        VStack {
            HStack {
                Image("shopImage\(item.product?.id)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                VStack(alignment: .leading) {
                    HStack {
                        Text("총 \(item.qty)건")
                        Spacer()
                        Text("주문상세")
                    }
                    Text("\(item.product?.name)")
                    Text("\(item.product?.price)원")
                }
            }
            Divider()
        }
        .listRowBackground(Color.clear)
    }
}

#Preview {
    OrderCellView()
}
