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
    
    @State private var isEditName: Bool = false
    // 임시
    @State private var name: String = "닉네임"
    @State private var isOkay: Bool = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 30) {
                Spacer()
                    .frame(height: 100)
                HStack {
                    if isEditName {
                        TextEditor(text: $name)
                            .frame(height: 40)
                            .textFieldStyle(.roundedBorder)
                        RoundRectangleButton(height: 30, fontSize: 13, title: "중복확인") {
                            //TODO: 중복 확인 api
                            isOkay = true
                        }
                            .frame(width: 50)
                    } else {
                        Text("\(name)")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                    }
                    Image(systemName: !isEditName ? "pencil" : "checkmark.rectangle.fill")
                        .foregroundStyle(!isEditName ? .textGray : (isOkay ? .accent : .textGray))
                        .font(.system(size: 20))
                        .onTapGesture {
                            if isEditName {
                                if isOkay {
                                    isEditName = false
                                }
                            } else {
                                isEditName = true
                            }
                        }
                }
                Text("이메일")
                    .font(.system(size: 20))
                Divider()
                
                Text("주소 변경")
                    .onTapGesture {
                        coordinator.appendPath(.addrEditView)
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
