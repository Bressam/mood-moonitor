//
//  MoodView.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import Lottie
import RegisterMoodDomainInterface

public enum MoodViewStyle {
    case loop, playOnce
}

public struct MoodView: View {
    @State var currentMood: Mood
    @State var style: MoodViewStyle

    public init(mood: Mood,
                style: MoodViewStyle = .loop) {
        self.currentMood = mood
        self.style = style
    }

    public var body: some View {
        VStack(spacing: SpacingTokens.xsmall.constant) {
            animation
            Text(currentMood.name)
                .font(.appTitleFont)
                .foregroundStyle(getColor(for: currentMood))
        }
    }

    private var animation: some View {
        LottieView({
            await LottieAnimation.loadedFrom(url: getAnimationURL(for: currentMood))
        }, placeholder: {
            ProgressView()
                .frame(width: 120, height: 120)
        })
        .animationSpeed(1.2)
        .playing(loopMode: .playOnce)
        .if(style == .loop, transform: { lottieView in
            lottieView.looping()
        })
        .scaleEffect(getScaleEffect(for: currentMood))
        .frame(width: 220, height: 220)
    }

    private func getAnimationURL(for mood: Mood) -> URL {
        let resources = Files.Modules.DesignSystem.Components.Implementation.Resources.self
        switch mood {
        case .veryUnpleasant: return resources.moodVeryUnpleasantJson.url
        case .unpleasant: return resources.moodUnpleasantJson.url
        case .neutral: return resources.moodNeutralJson.url
        case .pleasant: return resources.moodPleasantJson.url
        case .veryPleasant: return resources.moodVeryPleasantJson.url
        }
    }

    private func getScaleEffect(for mood: Mood) -> CGFloat {
        switch mood {
        case .veryUnpleasant: return 1
        case .unpleasant: return 1
        case .neutral: return 1.6
        case .pleasant: return 3
        case .veryPleasant: return 1.3
        }
    }

    private func getColor(for mood: Mood) -> Color {
        switch mood {
        case .veryUnpleasant: return .purple
        case .unpleasant: return .cyan
        case .neutral: return .yellow
        case .pleasant: return .green.opacity(0.8)
        case .veryPleasant: return .green
        }
    }

    public func moodColor() -> Color {
        return getColor(for: currentMood)
    }
}

#Preview {
    List {
        MoodView(mood: .veryUnpleasant)
        MoodView(mood: .unpleasant)
        MoodView(mood: .neutral)
        MoodView(mood: .pleasant)
        MoodView(mood: .veryPleasant)
    }
}
