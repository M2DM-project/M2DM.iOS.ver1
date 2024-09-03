//
//  Coordinator.swift
//  M2DM
//
//  Created by 최주리 on 5/27/24.
//

import SwiftUI

enum TabViewType {
    case shopping, menu, cart, mypage
}

enum Page {
    case shopListView
    case searchView
    case searchResultView
    case shopDetailView
    
    case menuView
    
    case groupPurchaseListView
    case groupPurchaseDetailView
    
    case orderAddressView
}

final class Coordinator: ObservableObject {
    static let shared = Coordinator()
    
    var selectedTab: TabViewType = .shopping
    var fromTab: Page = .shopListView
    
    var searchText: String = ""
    var price: Int = 0
    
    var shopType: ShopTypeEnum = .shop
    
    //MARK: - NavigationPath
    
    @Published var shoppingPath: NavigationPath = NavigationPath()
    @Published var menuPath: NavigationPath = NavigationPath()
    @Published var cartPath: NavigationPath = NavigationPath()
    @Published var mypagePath: NavigationPath = NavigationPath()
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .shopListView:
            ShopListView()
        case .searchView:
            SearchView()
        case .searchResultView:
            SearchResultView()
        case .shopDetailView:
            ShopDetailView()
            
        case .menuView:
            MenuView()
        
        case .groupPurchaseListView:
            GroupPurchaseListView()
        case .groupPurchaseDetailView:
            GroupPurchaseDetailView()
            
        case .orderAddressView:
            OrderAddressView(price: price)
        }
    }
    
    func appendPath(_ page: Page) {
        switch selectedTab {
        case .shopping:
            shoppingPath.append(page)
        case .menu:
            menuPath.append(page)
        case .cart:
            cartPath.append(page)
        case .mypage:
            mypagePath.append(page)
        }
    }
    
    func pop(_ depth: Int = 1) {
        switch selectedTab {
        case .shopping:
            shoppingPath.removeLast(depth)
        case .menu:
            menuPath.removeLast(depth)
        case .cart:
            cartPath.removeLast(depth)
        case .mypage:
            mypagePath.removeLast(depth)
        }
    }
}
