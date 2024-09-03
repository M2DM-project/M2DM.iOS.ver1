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
    
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    
    @State private var pay: String = ""
    
    @State private var isCard: Bool = false
    @State private var isCash: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("주문자")
                    HStack {
                        Text("이름")
                        Text("전화번호")
                        Text("이메일")
                    }
                    HStack {
                        TextField("", text: $name)
                        TextField("", text: $phone)
                        TextField("", text: $email)
                    }
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("배송지")
                    HStack {
                        Text("받는 사람")
                        Text("전화번호")
                        Text("주소")
                    }
                    HStack {
                        TextField("", text: $name)
                        TextField("", text: $phone)
                        TextField("", text: $email)
                    }
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("결제수단")
                    
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
                        VStack {
                            TextField("일시불", text: $pay)
                        }
                    } else if isCash {
                        VStack {
                            Text("우리은행 1001-2220-111234")
                        }
                    }
                    
                }
                .padding()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("결제 금액")
                        Spacer()
                        Text("\(price)원")
                    }
                }
                .padding()
                
                RoundRectangleButton(title: "참여하기") {
                    Task {
                        
                        //TODO: 참여 완료 + acheive시 성공한다는 안내 alert 띄우기
                        
                        coordinator.pop(2)
                    }
                }
            }
            .background(Color.white)
        }
    }
}
