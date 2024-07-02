//
//  CartView.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import SwiftUI

struct CartView: View {
    // 임시
    @State var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            Color.background
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: 50)
                    HStack {
                        Toggle("전체선택", isOn: $isSelected)
                            .toggleStyle(CheckboxToggleStyle())
                            .onChange(of: isSelected, {
                                
                            })
                        Spacer()
                        Text("상품삭제")
                            .foregroundStyle(.textLightGray)
                            .onTapGesture {
                                // TODO: 선택된 상품 삭제
                            }
                    }
                    .padding(.vertical)
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                        VStack {
                            ForEach(0..<5) { item in
                                cartItemView()
                                Divider()
                            }
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                        VStack {
                            HStack {
                                Text("총 상품금액")
                                Spacer()
                                Text("0원")
                                    .fontWeight(.bold)
                            }
                            .padding(.bottom, 5)
                            
                            HStack {
                                Text("배송비")
                                Spacer()
                                Text("3000원")
                                    .fontWeight(.bold)
                            }
                            
                            HStack {
                                Text("결제 금액")
                                Spacer()
                                Text("3000원")
                            }
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.vertical)
                        }
                        .padding()
                    }
                    .padding(.vertical)
                    
                    RoundRectangleButton(title: "구매하기")
                    
                    Spacer()
                        .frame(height: 100)
                }
                .scrollIndicators(.hidden)
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

fileprivate extension CartView {
    func cartItemView() -> some View {
        HStack {
            // TODO: 체크박스
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .foregroundStyle(.accent)
                .onTapGesture {
                    // TODO: viewmodel에서 array에 넣고 빼고 ..
                    isSelected.toggle()
                }
            
            Image(.shopImage1)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                Text("탁상스탠드, 24cm")
                    .fontWeight(.bold)
                HStack {
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "minus.square.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.accent)
                        })
                        
                        Text("0")
                            .font(.body)
                            .frame(width: 50)
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "plus.app.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.accent)
                        }
                        
                        Spacer()
                        
                        Text("0원")
                            .font(.body)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    CartView()
}
