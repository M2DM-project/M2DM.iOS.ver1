//
//  SearchView.swift
//  M2DM
//
//  Created by 최주리 on 5/27/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            
        }
        .searchable(text: $searchText)
        .onSubmit(of: .search) {
            if !searchText.isEmpty {
                coordinator.fromTab = .searchView
                coordinator.searchText = searchText
                coordinator.appendPath(.searchResultView)
                
                searchText = ""
            }
        }
    }
}

#Preview {
    SearchView()
}
