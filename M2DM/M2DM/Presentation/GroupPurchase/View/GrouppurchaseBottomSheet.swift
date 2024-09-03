//
//  GrouppurchaseBottomSheet.swift
//  M2DM
//
//  Created by 최주리 on 9/3/24.
//

import SwiftUI

struct GrouppurchaseBottomSheet: View {
    @State private var count = 1
    var item: GroupPurchase
    @Binding var isShowing: Bool
    @EnvironmentObject private var coordinator: Coordinator
    
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
                        if count < item.maxQty {
                            count += 1
                        }
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
            RoundRectangleButton(title: "참여하기") {
                Task {
                    isShowing = false
                    coordinator.price = item.price * count
                    coordinator.appendPath(.orderAddressView)
                }
            }
        }
        .padding()
    }
}
