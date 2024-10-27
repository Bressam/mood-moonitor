//
//  MoodsSelectionView.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct MoodsSelectionView: View {
    // MARK: - Properties
    @ObservedObject
    private var viewModel: MoodsSelectionViewModel

    // MARK: Init
    public init(viewModel: MoodsSelectionViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Views
    var body: some View {
        VStack {
            currentMoodView
            MoodSliderView(currentMood: $viewModel.selectedMood)
            MMButton(title: "Continue") {
                viewModel.handleFinishSelectedFeelings()
            }
        }
        .onAppear(perform: {
            Task {
                await viewModel.fetchAvailableFeelings()
            }
        })
    }

    private var currentMoodView: some View {
        MoodGradientView(currentMood: $viewModel.selectedMood, hasShadow: false)
        .padding([.top], SpacingTokens.large.constant)
    }
}

import RegisterMoodDomainInterface

struct MoodSliderView: View {
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

    var body: some View {
        VStack {
            Text("Current Mood: \(currentMood.name.capitalized)")
                .font(.title2)
                .padding()
            ZStack(alignment: .leading) {
                // Capsule Background
                Capsule()
//                    .fill(Color(red: 142/255, green: 142/255, blue: 142/255))
                    .fill(DesignSystemAsset.secondaryColor.swiftUIColor.opacity(0.6))
                    .frame(height: 24)

                // Progress Fill based on slider value
                var width = CGFloat(sliderValue.wrappedValue / Double(moodCases.count - 1)) * UIScreen.main.bounds.width * 0.99
                Capsule()
                    .fill(DesignSystemAsset.primaryColor.swiftUIColor)
                    .frame(width: max(0, min(width, UIScreen.main.bounds.width * 0.92)), height: 24)

                // Slider Handle
                Slider(value: sliderValue,
                       in: 0...Double(moodCases.count - 1),
                       step: 1)
                    .opacity(0.1)
            }
            .padding()
        }
    }
}

#Preview {
    MoodsSelectionView(viewModel: .preview)
}
