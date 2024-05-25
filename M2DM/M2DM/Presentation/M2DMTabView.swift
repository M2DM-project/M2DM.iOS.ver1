//
//  M2DMTabView.swift
//  M2DM
//
//  Created by 최주리 on 5/24/24.
//

import SwiftUI

struct M2DMTabView: View {
    var body: some View {
        Text("Login Success!")
        Text("key: \(KeyChain.read(key: "access_token"))")
    }
}

#Preview {
    M2DMTabView()
}
