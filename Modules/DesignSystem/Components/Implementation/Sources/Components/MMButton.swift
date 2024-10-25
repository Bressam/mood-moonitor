//
//  MMButton.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 24/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI

public enum MMButtonStyle {
    case primary, secondary

    var fillColor: Color {
        switch self {
        case .primary: return DesignSystemAsset.primaryColor.swiftUIColor
        case .secondary: return DesignSystemAsset.secondaryActionColor.swiftUIColor.opacity(0.2)
        }
    }

    var textColor: Color {
        switch self {
        case .primary: return .white
        case .secondary: return DesignSystemAsset.secondaryColor.swiftUIColor
        }
    }

    var titleFont: Font {
        switch self {
        case .primary: return .appActionFont
        case .secondary: return .appBodyFont
        }
    }
}

public struct MMButton: View {
    let action: () -> Void
    let title: String
    let style: MMButtonStyle

    public init(title: String,
                style: MMButtonStyle = .primary,
                action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.action = action
    }

    public var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(style.titleFont)
                .foregroundColor(style.textColor)
        })
        .frame(width: ButtonSizeTokens.large.widthConstant,
               height: ButtonSizeTokens.large.heightConstant)
        .background(style.fillColor)
        .buttonStyle(.borderless)
        .cornerRadius(10)
    }
}

#Preview {
    MMButton(title: "Button title!", action: {})
    MMButton(title: "Button title!",
             style: .secondary, action: {})
}
