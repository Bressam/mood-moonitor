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
    case large, appleSignIn

    public var constant: CGFloat {
        switch self {
        case .large: return 46
        case .appleSignIn: return 48
        }
    }
}

public enum RadiusTokens {
    case small, xsmall

    public var constant: CGFloat {
        switch self {
        case .small: return 8
        case .xsmall: return 4
        }
    }
}
