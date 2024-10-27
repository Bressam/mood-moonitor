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
        VStack(spacing: SpacingTokens.small.constant) {
            headerView
            currentMoodView
            MoodSliderView(currentMood: $viewModel.selectedMood)
            Spacer()
            VStack(spacing: SpacingTokens.small.constant) {
                MMButton(title: "Continue") {
                    viewModel.handleFinishSelectedFeelings()
                }
                MMButton(title: "Cancel", style: .secondary) {
                    viewModel.dismiss()
                }
            }
        }
        .padding([.leading, .trailing], SpacingTokens.medium.constant)
        .padding([.bottom], SpacingTokens.large.constant)
        .onAppear(perform: {
            Task {
                await viewModel.fetchAvailableFeelings()
            }
        })
    }

    private var headerView: some View {
        Text("Choose how you felt today")
            .frame(minHeight: 90)
            .font(.appLargeTitleFont)
            .multilineTextAlignment(.center)
            .padding([.top], SpacingTokens.small.constant)
    }

    private var currentMoodView: some View {
        MoodGradientView(currentMood: $viewModel.selectedMood,
                         hasShadow: false,
                         hasMoodName: false)
        .padding([.top], SpacingTokens.large.constant)
    }
}

#Preview {
    MoodsSelectionView(viewModel: .preview)        .presentationDetents([.medium, .large])
        .presentationBackgroundInteraction(.enabled)
        .presentationDragIndicator(.visible)
}
