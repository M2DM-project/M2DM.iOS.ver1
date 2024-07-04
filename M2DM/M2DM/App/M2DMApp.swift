//
//  M2DMApp.swift
//  M2DM
//
//  Created by 최주리 on 5/24/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct M2DMApp: App {
    @StateObject private var shoppingViewModel = ShoppingViewModel()
    @StateObject private var coordinator = Coordinator.shared
    @StateObject private var authenticationViewModel = AuthenticationViewModel()
    @StateObject private var cartViewModel = CartViewModel()
    
    init() {
        //kakao sdk 초기화
        guard let kakaoAppKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_APP_KEY") else {return}
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
    }
    
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color.background
                LoginView()
                    .onOpenURL { url in
                        if (AuthApi.isKakaoTalkLoginUrl(url)) {
                            _ = AuthController.handleOpenUrl(url: url)
                        }
                    }
            }
            .ignoresSafeArea()
        }
        .environmentObject(shoppingViewModel)
        .environmentObject(coordinator)
        .environmentObject(authenticationViewModel)
        .environmentObject(cartViewModel)
        
    }
}
