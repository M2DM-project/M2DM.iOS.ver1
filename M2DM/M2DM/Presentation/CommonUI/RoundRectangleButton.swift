//
//  RoundRectangleButtonView.swift
//  M2DM
//
//  Created by 최주리 on 6/18/24.
//

import SwiftUI

struct RoundRectangleButton: View {
    var cornerRadius: CGFloat
    var height: CGFloat
    var foreGroundColor: Color
    var fontsize: CGFloat
    
    var title: String
    var isDisabled: Bool
    
    var buttonAction: () -> () = { }
    
    init(
        cornerRadius: CGFloat = 10,
        height: CGFloat = 45,
        foreGroundColor: Color = .accent,
        fontSize: CGFloat = 18,
        title: String = "버튼 타이틀",
        isDisabled: Bool = false,
        buttonAction: @escaping () -> Void = { }
    ) {
        self.cornerRadius = cornerRadius
        self.height = height
        self.foreGroundColor = foreGroundColor
        self.fontsize = fontSize
        self.title = title
        self.isDisabled = isDisabled
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        Button {
            buttonAction()
        } label: {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundStyle(!isDisabled ? .accent : .textLightGray)
                .overlay {
                    Text(title)
                        .font(.system(size: fontsize))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }
        }
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .disabled(isDisabled)
    }
}

#Preview {
    RoundRectangleButton()
}
