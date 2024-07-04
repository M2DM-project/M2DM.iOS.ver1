//
//  M2DMTabView.swift
//  M2DM
//
//  Created by 최주리 on 5/24/24.
//

import SwiftUI

struct M2DMTabView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            NavigationStack(path: $coordinator.shoppingPath) {
                ShopListView()
                    .navigationDestination(for: Page.self) { page in
                        coordinator.build(page)
                    }
            }
            .tabItem {
                Image(systemName: "house")
                Text("MAIN")
            }
            .tag(TabViewType.shopping)
            
            NavigationStack(path: $coordinator.menuPath) {
                MenuView()
                    .navigationDestination(for: Page.self) { page in
                        coordinator.build(page)
                    }
            }
            .tabItem {
                Image(systemName: "line.3.horizontal")
                Text("MENU")
            }
            .tag(TabViewType.menu)
            
            NavigationStack(path: $coordinator.cartPath) {
                CartView()
                    .navigationDestination(for: Page.self) { page in
                        coordinator.build(page)
                    }
            }
            .tabItem {
                Image(systemName: "cart.fill")
                Text("CART")
            }
            .tag(TabViewType.cart)
            
            NavigationStack(path: $coordinator.mypagePath) {
                MyPageView()
                    .navigationDestination(for: Page.self) { page in
                        coordinator.build(page)
                    }
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
