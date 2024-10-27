//
//  MoodView.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import Lottie
import MoodRegistryDomainInterface

public enum MoodViewStyle {
    case loop, playOnce
}

public struct MoodView: View {
    @Binding var currentMood: Mood
    @State var style: MoodViewStyle
    @State var hasTitle: Bool

    public init(mood: Binding<Mood>,
                style: MoodViewStyle = .loop,
                hasTitle: Bool = true) {
        self._currentMood = mood
        self.style = style
        self.hasTitle = hasTitle
    }

    public var body: some View {
        VStack(spacing: SpacingTokens.xsmall.constant) {
            animation
            Text(currentMood.name)
                .font(.appTitleFont)
                .opacity(hasTitle ? 1.0 : 0.0)
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
        .id(currentMood.id)
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
}

#Preview {
    List {
        let veryUnpleasant: Binding<Mood> =  .constant(.veryUnpleasant)
        let unpleasant: Binding<Mood> =  .constant(.unpleasant)
        let neutral: Binding<Mood> =  .constant(.neutral)
        let pleasant: Binding<Mood> =  .constant(.pleasant)
        let veryPleasant: Binding<Mood> =  .constant(.veryPleasant)
        MoodView(mood: veryUnpleasant)
            .listRowBackground(Color.black.opacity(0.7))
        MoodView(mood: unpleasant)
            .listRowBackground(Color.black.opacity(0.7))
        MoodView(mood: neutral)
            .listRowBackground(Color.black.opacity(0.7))
        MoodView(mood: pleasant)
            .listRowBackground(Color.black.opacity(0.7))
        MoodView(mood: veryPleasant)
            .listRowBackground(Color.black.opacity(0.7))
    }
}
