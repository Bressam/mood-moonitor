//
//  MoodSliderView.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import RegisterMoodDomainInterface

public struct MoodSliderView: View {
    private let moodCases: [Mood] = Mood.allCases
    @Binding var currentMood: Mood

    private var sliderValue: Binding<Double> {
        Binding(
            get: {
                Double(moodCases.firstIndex(of: currentMood) ?? 0)
            },
            set: { newValue in
                currentMood = moodCases[min(max(Int(newValue.rounded()), 0), moodCases.count - 1)]
            }
        )
    }

    public init(currentMood: Binding<Mood>) {
        self._currentMood = currentMood
    }

    public var body: some View {
        VStack(spacing: SpacingTokens.medium.constant) {
            Text("\(currentMood.name.capitalized)")
                .font(.appTitleFont)

            MMSliderView(value: sliderValue,
                         sliderRange: 0...Double(moodCases.count - 1),
                         thumbColor: DesignSystemAsset.secondaryColor.swiftUIColor.opacity(1),
                         minTrackColor: DesignSystemAsset.secondaryColor.swiftUIColor.opacity(1),
                         maxTrackColor: DesignSystemAsset.secondaryColor.swiftUIColor.opacity(0.3))
            .frame(height: 30)
        }
        .padding()
    }
}