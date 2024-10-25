//
//  LoadingIndicator.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 24/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import Lottie

public struct LoadingIndicatorView: View {
    private let loadingURL = Files.Modules.DesignSystem.Components.Implementation.Resources.loadingAstronautJson.url

    public init() {}

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
            await LottieAnimation.loadedFrom(url: loadingURL)
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
}
