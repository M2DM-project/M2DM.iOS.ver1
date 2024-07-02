//
//  CheckboxToggleStyle.swift
//  M2DM
//
//  Created by 최주리 on 7/1/24.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                configuration.label
                    .foregroundStyle(.textGray)
                    .fontWeight(.bold)
            }
        })
    }
}
