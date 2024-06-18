//
//  LoginView.swift
//  M2DM
//
//  Created by 최주리 on 5/24/24.
//

import SwiftUI
import KakaoSDKUser

struct LoginView: View {
    @StateObject private var authenticationViewModel = AuthenticationViewModel()
    
    var body: some View {
        if KeyChain.read(key: "access_token") != nil {
            M2DMTabView()
        } else {
            VStack {
                Text("간편 로그인")
                    .foregroundStyle(.textGray)
                    .fontWeight(.bold)
                    .font(.system(.title3))
                    .padding(.bottom, 100)
                
                Button {
                    authenticationViewModel.getKakaoToken()
                } label: {
                    Image("kakaoLogin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * 0.7)
                }
            }
            
        }
    }
}

#Preview {
    LoginView()
}
