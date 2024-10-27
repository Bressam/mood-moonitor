//
//  MoodSliderView.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import MoodRegistryDomainInterface

public struct MoodSliderView: View {
    private let moodCases: [Mood] = Mood.allCases
    @Binding var currentMood: Mood
    @State private var sliderPosition: Double = 0

    public init(currentMood: Binding<Mood>) {
        self._currentMood = currentMood
        self._sliderPosition = State(initialValue: Double(Mood.allCases.firstIndex(of: currentMood.wrappedValue) ?? 0))
    }

    public var body: some View {
        VStack(spacing: 20) {
            Text("\(currentMood.name.capitalized)")
                .font(.title)

            MMSliderView(value: $sliderPosition,
                         sliderRange: 0...Double(moodCases.count - 1),
                         thumbColor: DesignSystemAsset.secondaryColor.swiftUIColor.opacity(1),
                         minTrackColor: .clear,
                         maxTrackColor: DesignSystemAsset.secondaryColor.swiftUIColor.opacity(0.3))
            .onChange(of: sliderPosition, { _, newValue in
                let newIndex = Int(newValue.rounded())
                if moodCases.indices.contains(newIndex), moodCases[newIndex] != currentMood {
                    currentMood = moodCases[newIndex]
                }
            })
            .frame(height: 30)
        }
        .padding()
    }
}
