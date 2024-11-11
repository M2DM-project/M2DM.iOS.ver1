//
//  MyPageView.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import SwiftUI

struct MyPageView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var myPageViewModel: MyPageViewModel
    @EnvironmentObject private var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 100)
            HStack {
                VStack {
                    Text("닉네임")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(10)
                    Text("이메일")
                        .padding(5)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(20)
            }
            .padding()
            .padding(.leading, 30)
            .onTapGesture {
                coordinator.appendPath(.myPageInfoView)
            }
            
            Divider()
            
            VStack {
                HStack {
                    VStack {
                        Text("주문내역")
                            .fontWeight(.bold)
                        Text("\(myPageViewModel.orderCount)")
                            .foregroundStyle(.textLightGray)
                            .onTapGesture {
                                coordinator.appendPath(.myPageOrderListView)
                            }
                    }
                    .padding()
                    VStack {
                        Text("나의리뷰")
                            .fontWeight(.bold)
                        Text("0")
                            .foregroundStyle(.textLightGray)
                    }
                    .padding()
                    VStack {
                        Text("찜한목록")
                            .fontWeight(.bold)
                        Text("0")
                            .foregroundStyle(.textLightGray)
                    }
                    .padding()
                }
                HStack {
                    VStack {
                        Text("판매중고")
                            .fontWeight(.bold)
                        Text("0")
                            .foregroundStyle(.textLightGray)
                    }
                    .padding()
                    VStack {
                        Text("구매중고")
                            .fontWeight(.bold)
                        Text("0")
                            .foregroundStyle(.textLightGray)
                    }
                    .padding()
                    VStack {
                        Text("공구참여")
                            .fontWeight(.bold)
                        Text("0")
                            .foregroundStyle(.textLightGray)
                    }
                    .padding()
                }
            }
            .padding()
            Spacer()
        }
        .ignoresSafeArea()
        .background(Color.background)
        .navigationTitle("마이페이지")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            myPageViewModel.loadMyOrder()
        }
    }
}

#Preview {
    MyPageView()
}
