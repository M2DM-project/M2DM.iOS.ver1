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
    //case productDetailView
}

final class Coordinator: ObservableObject {
    static let shared = Coordinator()
    
    var selectedTab: TabViewType = .shopping
    
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
        //case .productDetailView:
            
        }
    }
}
