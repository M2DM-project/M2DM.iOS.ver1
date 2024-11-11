//
//  OrderDetailView.swift
//  M2DM
//
//  Created by 최주리 on 11/6/24.
//

import SwiftUI

struct OrderDetailView: View {
    var body: some View {
        VStack(spacing: 10) {
            ScrollView {
                ZStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("배송지정보")
                            .fontWeight(.bold)
                        HStack(spacing: 10) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("받는 사람")
                                Text("연락처")
                                Text("주소\n")
                            }
                            .foregroundStyle(.textGray)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("최주리")
                                Text("010-2222-2222")
                                Text("(58000) 서울 성동구 왕십리로 83-21 B1")
                            }
                        }
                    }
                }
                .padding()
                .background(.white)
                
                ZStack {
                    VStack(alignment: .leading) {
                        Text("주문상품")
                            .fontWeight(.bold)
                        HStack(spacing: 10) {
                            Image(.gpImage121)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .aspectRatio(contentMode: .fill)
                            VStack(alignment: .leading) {
                                Text("탁상스탠드")
                                Text("98,000원")
                                    .fontWeight(.bold)
                                RoundRectangleButton(title: "리뷰쓰기")
                            }
                        }
                    }
                }
                .padding()
                .background(.white)
            }
        }
        .padding(.vertical)
        .background(Color.background)
    }
}

#Preview {
    OrderDetailView()
}
