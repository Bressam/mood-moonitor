//
//  LayoutConstants.swift
//  WeatherApp
//
//  Created by Giovanne Bressam on 24/06/24.
//

import Foundation

public enum SpacingTokens {
    case xsmall, small, medium, xmedium, large, xlarge, xxlarge

    public var constant: CGFloat {
        switch self {
        case .xsmall: return 4
        case .small: return 8
        case .medium: return 16
        case .xmedium: return 20
        case .large: return 24
        case .xlarge: return 32
        case .xxlarge: return 40
        }
    }
}

public enum ButtonSizeTokens {
    case large

    public var heightConstant: CGFloat {
        switch self {
        case .large: return 44
        }
    }

    public var widthConstant: CGFloat {
        switch self {
        case .large: return 280
        }
    }
}

public enum RadiusTokens {
    case small, xsmall, regular

    public var constant: CGFloat {
        switch self {
        case .regular: return 12
        case .small: return 8
        case .xsmall: return 4
        }
    }
}
