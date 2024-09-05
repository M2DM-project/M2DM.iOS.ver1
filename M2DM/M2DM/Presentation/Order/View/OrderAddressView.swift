//
//  OrderAddressView.swift
//  M2DM
//
//  Created by 최주리 on 8/22/24.
//

import SwiftUI
import WebKit

struct OrderAddressView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var orderViewModel: OrderViewModel
    
    @State private var orderName: String = ""
    @State private var orderPhone: String = ""
    @State private var orderEmail: String = ""
    
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var streetAddr: String = ""
    @State private var zipcode: String = ""
    @State private var detailAddr: String = ""
    
    @State private var pay: String = "카드사 선택"
    
    @State private var isCard: Bool = true
    @State private var isCash: Bool = false
    
    @State private var isShowingWebView: Bool = false
    @State private var isShowingSuccessView: Bool = false
    
    @State private var isDisabled: Bool = true
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 100)
                    VStack(alignment: .leading) {
                        Text("주문자")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                        HStack {
                            Text("이름")
                            Spacer()
                            TextField("이름", text: $orderName)
                                .frame(width: 270)
                            
                        }
                        HStack {
                            Text("전화번호")
                            Spacer()
                            TextField("전화번호", text: $orderPhone)
                                .frame(width: 270)
                        }
                        HStack {
                            Text("이메일")
                            Spacer()
                            TextField("이메일", text: $orderEmail)
                                .frame(width: 270)
                        }
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("배송지")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                        
                        HStack {
                            Text("이름")
                            Spacer()
                            TextField("이름", text: $name)
                                .frame(width: 270)
                        }
                        HStack {
                            Text("전화번호")
                            Spacer()
                            TextField("전화번호", text: $phone)
                                .frame(width: 270)
                        }
                        HStack {
                            Text("주소")
                            Spacer()
                            VStack {
                                HStack {
                                    RoundRectangleButton(height: 30, fontSize: 13, title: "우편번호") {
                                        isShowingWebView = true
                                    }
                                    .frame(width: 70)
                                    TextField("우편번호", text: $zipcode)
                                        .disabled(true)
                                        .frame(width: 200)
                                }
                                TextField("주소", text: $streetAddr)
                                    .disabled(true)
                                    .frame(width: 270)
                                TextField("상세 주소 입력", text: $detailAddr)
                                    .frame(width: 270)
                            }
                        }
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 15) {
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
                                        .font(.system(size: 40))
                                    Text("카드")
                                }
                            })
                            
                            Button(action: {
                                isCard = false
                                isCash = true
                            }, label: {
                                VStack {
                                    Image(systemName: "dollarsign.circle")
                                        .font(.system(size: 40))
                                    Text("무통장입금")
                                }
                            })
                        }
                        
                        if isCard {
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
                            Text("\(coordinator.price)원")
                        }
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    }
                    .padding()
                    
                    //TODO: disable 처리 하기
                    RoundRectangleButton(title: coordinator.shopType == .groupPurchase ? "참여하기" : "구매하기") {
                        Task {
                            //TODO: 공동구매에서 참여 완료 + acheive시 성공한다는 안내 alert 띄우기
                            orderViewModel.orderProduct(id: coordinator.productId, qty: coordinator.qty, name: name, contact: phone, zipcode: zipcode, street: streetAddr, detail: detailAddr)
                            isShowingSuccessView = true
                        }
                    }
                    .padding()
                    .padding(.bottom, 70)
                }
                .background(Color.background)
            }
            
            if isShowingSuccessView {
                OrderSuccessSheet()
            }
        }
        .ignoresSafeArea()
        .navigationTitle("주문/결제")
        .toolbarRole(.editor)
        .sheet(isPresented: $isShowingWebView, content: {
            WebView(url: URL(string: "https://m2dm-project.github.io/M2DM.iOS.ver1/")!, isShowing: $isShowingWebView, addr: $streetAddr, zipcode: $zipcode)
        })
        
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    var webView: WKWebView?
    @Binding var isShowing: Bool
    @Binding var addr: String
    @Binding var zipcode: String
    
    init(url: URL, webView: WKWebView? = nil, isShowing: Binding<Bool>, addr: Binding<String>, zipcode: Binding<String>) {
        self.url = url
        self.webView = WKWebView()
        self._isShowing = isShowing
        self._addr = addr
        self._zipcode = zipcode
        self.webView?.configuration.userContentController.add(AddressWebController(isShowing: $isShowing, addr: $addr, zipcode: $zipcode), name: "callBackHandler")
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webView?.load(request)
        return webView!
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

class AddressWebController: NSObject, WKScriptMessageHandler {
    @Binding var isShowing: Bool
    @Binding var addr: String
    @Binding var zipcode: String
    
    init(isShowing: Binding<Bool>, addr: Binding<String>, zipcode: Binding<String>) {
        self._isShowing = isShowing
        self._addr = addr
        self._zipcode = zipcode
    }
    
    @MainActor
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        Task {
            if message.name == "callBackHandler", let data = message.body as? [String: Any] {
                // 기본 주소
                if let address = data["address"] as? String {
                    print(address)
                }
                
                // 지번 주소
                if let jibunAddress = data["jibunAddress"] as? String {
                    print(jibunAddress)
                }
                
                // 도로명 주소
                if let roadAddress = data["roadAddress"] as? String {
                    print(roadAddress)
                    addr = roadAddress
                }
                
                // 우편번호
                if let zipcode = data["zonecode"] as? String {
                    print(zipcode)
                    self.zipcode = zipcode
                }
            }
            isShowing = false
        }
    }
}
