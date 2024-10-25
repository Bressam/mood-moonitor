//
//  Untitled.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 23/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

/**
 More details at:  https://developer.apple.com/design/human-interface-guidelines/typography
 */

import SwiftUI

public extension Font {
    static let appBodyFont: Font = getAppFont(size: 17)
    static let appTitleFont: Font = getAppFont(size: 22, weight: .semibold)
    static let appLargeTitleFont: Font = getAppFont(size: 34, weight: .bold)
    static let appCalloutFont: Font = getAppFont(size: 16, weight: .regular)
    static let appFootnoteFont: Font = getAppFont(size: 13, weight: .regular)
    static let appCaptionFont: Font = getAppFont(size: 11, weight: .ultraLight)

    static func getAppFont(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        return .system(size: size, weight: weight)
    }
}
