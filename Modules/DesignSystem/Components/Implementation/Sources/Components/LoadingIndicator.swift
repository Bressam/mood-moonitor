//
//  LoadingIndicator.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 24/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import Lottie

public enum LoadingIndicatorStyle {
    case astronaut, rocket

    var animationURL: URL {
        let basePath = Files.Modules.DesignSystem.Components.Implementation.Resources.self
        switch self {
        case .astronaut: return basePath.loadingAstronautJson.url
        case .rocket: return basePath.loadingTakeoffJson.url
        }
    }
}

public struct LoadingIndicatorView: View {
    @State var style: LoadingIndicatorStyle

    public init(style: LoadingIndicatorStyle = .astronaut) {
        self.style = style
    }

    public var body: some View {
        VStack(spacing: SpacingTokens.xsmall.constant) {
            animation
            Text("Loading...")
                .font(.appTitleFont)
                .foregroundStyle(DesignSystemAsset.primaryColor.swiftUIColor)
        }
    }

    private var animation: some View {
        LottieView({
            await LottieAnimation.loadedFrom(url: style.animationURL)
        }, placeholder: {
            ProgressView()
                .frame(width: 120, height: 120)
        })
        .animationSpeed(2.0)
        .looping()
        .frame(width: 220, height: 220)
    }
}

#Preview {
    LoadingIndicatorView()
    LoadingIndicatorView(style: .rocket)
}
