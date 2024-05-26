//
//  M2DMTabView.swift
//  M2DM
//
//  Created by 최주리 on 5/24/24.
//

import SwiftUI

struct M2DMTabView: View {
    @StateObject private var coordinator = Coordinator.shared
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            NavigationStack {
                ShopListView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("MAIN")
            }
            .tag(TabViewType.shopping)
            
            NavigationStack {
                MenuView()
                    
            }
            .tabItem {
                Image(systemName: "line.3.horizontal")
                Text("MENU")
            }
            .tag(TabViewType.menu)
            
            NavigationStack {
                CartView()
                    
            }
            .tabItem {
                Image(systemName: "cart.fill")
                Text("CART")
            }
            .tag(TabViewType.cart)
            
            NavigationStack {
                MyPageView()
                   
            }
            .tabItem {
                Image(systemName: "person")
                Text("MYPAGE")
            }
            .tag(TabViewType.mypage)
        }
    }
}

#Preview {
    M2DMTabView()
}
