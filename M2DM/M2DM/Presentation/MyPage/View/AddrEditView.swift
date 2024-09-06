//
//  AddrEditView.swift
//  M2DM
//
//  Created by 최주리 on 9/6/24.
//

import SwiftUI

struct AddrEditView: View {
    
    @State private var isShowingWebView: Bool = false
    
    // 임시
    //TODO: 정보 받아서 textfield 채워두기
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var streetAddr: String = ""
    @State private var zipcode: String = ""
    @State private var detailAddr: String = ""
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 100)
            HStack {
                Text("주소")
                    .fontWeight(.bold)
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
                    TextField("도로명 주소", text: $streetAddr)
                        .disabled(true)
                        .frame(width: 270)
                    TextField("상세 주소 입력", text: $detailAddr)
                        .frame(width: 270)
                }
                .textFieldStyle(.roundedBorder)
            }
            .padding()
            .padding(.bottom, 50)
            
            RoundRectangleButton(title: "수정하기")
                .padding()
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $isShowingWebView, content: {
            AddrWebView(url: URL(string: "https://m2dm-project.github.io/M2DM.iOS.ver1/")!, isShowing: $isShowingWebView, addr: $streetAddr, zipcode: $zipcode)
        })
        .background(Color.background)
        .toolbarRole(.editor)
        .navigationTitle("주소 변경")
    }
}

#Preview {
    AddrEditView()
}
