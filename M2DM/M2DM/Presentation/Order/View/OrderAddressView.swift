//
//  OrderAddressView.swift
//  M2DM
//
//  Created by 최주리 on 8/22/24.
//

import SwiftUI

struct OrderAddressView: View {
    @EnvironmentObject private var coordinator: Coordinator
    var price: Int
    
    @State private var orderName: String = ""
    @State private var orderPhone: String = ""
    @State private var orderEmail: String = ""
    
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    
    @State private var pay: String = "카드사 선택"
    
    @State private var isCard: Bool = true
    @State private var isCash: Bool = false
    
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 100)
                VStack(alignment: .leading) {
                    Text("주문자")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("이름")
                            Text("전화번호")
                            Text("이메일")
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            TextField("이름", text: $orderName)
                            TextField("전화번호", text: $orderPhone)
                            TextField("이메일", text: $orderEmail)
                        }
                    }
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("배송지")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("이름")
                            Text("전화번호")
                            Text("주소")
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            TextField("이름", text: $name)
                            TextField("전화번호", text: $phone)
                            TextField("주소", text: $email)
                        }
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("결제수단")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    HStack {
                        Button(action: {
                            isCard = true
                            isCash = false
                        }, label: {
                            VStack {
                                Image(systemName: "creditcard")
                                Text("카드")
                            }
                        })
                        
                        Button(action: {
                            isCard = false
                            isCash = true
                        }, label: {
                            VStack {
                                Image(systemName: "dollarsign.circle")
                                Text("무통장입금")
                            }
                        })
                    }
                    
                    if isCard {
                        //TODO: 카드 선택
                        
                        Menu(content: {
                            ForEach(CardEnum.allCases, id: \.self) { option in
                                Button("\(option.description)") {
                                    pay = option.description
                                }
                            }
                        }, label: {
                            HStack {
                                Text("\(pay)")
                                Spacer()
                                Image(systemName: "arrowtriangle.down.fill")
                                    .font(.system(size: 12))
                            }
                        })
                        .foregroundStyle(.black)
            
                        Text("일시불")
                            .foregroundStyle(.gray)
                    } else if isCash {
                        Text("우리은행 1001-2220-111234")
                            .frame(maxWidth: .infinity)
                    }
                    
                }
                .padding()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("결제 금액")
                            .font(.system(size: 18))
                        Spacer()
                        Text("\(price)원")
                    }
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                }
                .padding()
                
                RoundRectangleButton(title: "참여하기") {
                    Task {
                        //TODO: 참여 완료 + acheive시 성공한다는 안내 alert 띄우기
                        
                        coordinator.pop(2)
                    }
                }
                .padding()
                .padding(.bottom, 50)
            }
            .background(Color.background)
        }
        .ignoresSafeArea()
        .navigationTitle("주문/결제")
        .toolbarRole(.editor)
    }
}
