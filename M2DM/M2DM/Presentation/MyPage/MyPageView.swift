//
//  MyPageView.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import SwiftUI

struct MyPageView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        ZStack {
            Color.background
            VStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 50)
                    .foregroundStyle(.clear)
                Text("주리")
                    .foregroundStyle(.textGray)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                Text("ddjdjdj@naver.com")
                    .foregroundStyle(.textLightGray)
                    .font(.system(size: 20))
                
                Divider()
                    .foregroundStyle(.textLightGray)
                
                VStack(spacing: 10) {
                    Text("구매내역")
                    Text("로그아웃")
                        .onTapGesture {
                            // TODO: 로그아웃 얼럿 띄우기
                            authenticationViewModel.logout()
                            coordinator.selectedTab = .shopping
                        }
                    Text("회원탈퇴")
                        .onTapGesture {
                            // TODO: 회원탈퇴 얼럿 띄우기
                            authenticationViewModel.withdrawal()
                            coordinator.selectedTab = .shopping
                        }
                }
                .foregroundStyle(.textGray)
                .font(.system(size: 20))
                
                Spacer()
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MyPageView()
}
