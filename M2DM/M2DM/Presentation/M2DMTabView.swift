//
//  M2DMTabView.swift
//  M2DM
//
//  Created by 최주리 on 5/24/24.
//

import SwiftUI

struct M2DMTabView: View {
    var body: some View {
        TabView() {
            NavigationStack {
                ShopView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("MAIN")
                    }
            }
            NavigationStack {
                MenuView()
                    .tabItem {
                        Image(systemName: "line.3.horizontal")
                        Text("MENU")
                    }
            }
            NavigationStack {
                CartView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("CART")
                    }
            }
            NavigationStack {
                MyPageView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("MYPAGE")
                    }
            }
        }
    }
}

#Preview {
    M2DMTabView()
}
