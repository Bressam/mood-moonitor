//
//  Untitled.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 23/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI

public extension Font {
    static let appBodyFont: Font = getAppFont(size: 14)
    static let appTitleFont: Font = getAppFont(size: 22, weight: .semibold)
    static let appLargeTitleFont: Font = getAppFont(size: 38, weight: .bold)

    static func getAppFont(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        return .system(size: size, weight: weight)
    }
}
