//
//  LoginView.swift
//  M2DM
//
//  Created by 최주리 on 5/24/24.
//

import SwiftUI
import KakaoSDKUser

struct LoginView: View {
    @EnvironmentObject private var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject private var mypageViewModel: MyPageViewModel
    @State private var isLoggined: Bool = false
    
    var body: some View {
        if authenticationViewModel.isLoggined {
            M2DMTabView()
                .onAppear {
                    mypageViewModel.loadUserInfo()
                }
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
                    Image(.kakaoLogin)
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
