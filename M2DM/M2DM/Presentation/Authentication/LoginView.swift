//
//  LoginView.swift
//  M2DM
//
//  Created by 최주리 on 5/24/24.
//

import SwiftUI
import KakaoSDKUser

struct LoginView: View {
    var body: some View {
        ZStack {
            Color.background
            VStack {
                Text("간편 로그인")
                    .foregroundStyle(.textGray)
                    .fontWeight(.bold)
                    .font(.system(.title3))
                    .padding(.bottom, 100)
                
                Button {
                    
                } label: {
                    Image("kakaoLogin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * 0.7)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
