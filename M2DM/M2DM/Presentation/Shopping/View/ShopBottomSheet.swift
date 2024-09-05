//
//  ShopBottomSheet.swift
//  M2DM
//
//  Created by 최주리 on 9/5/24.
//

import SwiftUI

struct ShopBottomSheet: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var orderViewModel: OrderViewModel
    
    @State private var count = 1
    var item: DetailProduct
    @Binding var isShowing: Bool
    
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            HStack {
                Text("\(item.name)")
                Spacer()
                Image(systemName: "xmark")
                    .onTapGesture {
                        isShowing = false
                    }
            }
            
            HStack(spacing: 5) {
                HStack {
                    Button(action: {
                        if count > 1 {
                            count -= 1
                        }
                    }, label: {
                        Image(systemName: "minus.square.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.accent)
                    })
                    
                    Text("\(count)")
                        .font(.body)
                        .frame(width: 50)
                    
                    Button{
                        count += 1
                    } label: {
                        Image(systemName: "plus.app.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.accent)
                    }
                    
                    Spacer()
                    
                    Text("\(item.price * count)원")
                        .font(.body)
                        .fontWeight(.bold)
                }
            }
            Spacer()
            RoundRectangleButton(title: "구매하기") {
                Task {
                    isShowing = false
                    orderViewModel.price = item.price * count
                    orderViewModel.qty = count
                    orderViewModel.productId = item.id
                    coordinator.appendPath(.orderAddressView)
                }
            }
        }
        .padding()
    }
}
