//
//  WebView.swift
//  M2DM
//
//  Created by 최주리 on 9/6/24.
//

import SwiftUI
import WebKit

struct AddrWebView: UIViewRepresentable {
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
