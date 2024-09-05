//
//  MyPageInfoView.swift
//  M2DM
//
//  Created by 최주리 on 9/5/24.
//

import SwiftUI

struct MyPageInfoView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 30) {
                Spacer()
                    .frame(height: 100)
                
                Text("닉네임")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text("이메일")
                    .font(.system(size: 20))
                Divider()
                
                Text("닉네임 변경")
                    .onTapGesture {
                        
                    }
                Text("주소 변경")
                    .onTapGesture {
                        
                    }
                
                Divider()
                
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
                Spacer()
            }
            .font(.system(size: 18))
            .foregroundStyle(.textGray)
            .padding(.leading, 30)
            
            Spacer()
        }
        .background(Color.background)
        .navigationTitle("내 정보")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
        .toolbarRole(.editor)
    }
}

#Preview {
    MyPageInfoView()
}
