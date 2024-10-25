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
        case .secondary: return DesignSystemAsset.secondaryColor.swiftUIColor.opacity(0.4)
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
                action: @escaping () -> Void,
                style: MMButtonStyle = .primary) {
        self.action = action
        self.title = title
        self.style = style
    }

    public var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(style.titleFont)
                .foregroundColor(style.textColor)
        })
        .background(style.fillColor)
        .buttonStyle(.bordered)
        .cornerRadius(10)
    }
}

#Preview {
    MMButton(title: "Button title!", action: {})
    MMButton(title: "Button title!", action: {}, style: .secondary)
}
