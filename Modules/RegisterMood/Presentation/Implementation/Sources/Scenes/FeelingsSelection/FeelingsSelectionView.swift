//
//  FeelingsSelectionView.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct FeelingsSelectionView: View {
    // MARK: - Properties
    @ObservedObject
    private var viewModel: FeelingsSelectionViewModel

    // MARK: Init
    public init(viewModel: FeelingsSelectionViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Views
    var body: some View {
        VStack {
            currentMoodView
            descriptionView
            feelingsListView
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
        MoodGradientView(currentMood: .constant(viewModel.currentMoodEntry.moodLevel),
                         style: .playOnce,
                         hasShadow: false)
            .padding([.top], SpacingTokens.large.constant)
    }

    private var descriptionView: some View {
        VStack(alignment: .leading) {
            Text("Select your feelings")
                .font(.appBodyFont)
                .padding([.top, .leading], SpacingTokens.medium.constant)
            Divider()
        }
    }

    private var feelingsListView: some View {
        ScrollView {
            FlowLayout(mode: .scrollable,
                       items: viewModel.feelings,
                       itemSpacing: SpacingTokens.small.constant,
                       viewMapping: { feeling in
                Text(feeling.name)
                    .padding(.horizontal, SpacingTokens.small.constant)
                    .frame(minWidth: 90, minHeight: 36)
                    .background(itemColor(isSelected: viewModel.checkSelected(feeling: feeling)))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: RadiusTokens.large.constant))
                    .onTapGesture {
                        viewModel.toggleSelection(for: feeling)
                    }
            })
            .padding()
        }
    }

    private func itemColor(isSelected: Bool) -> Color {
        if isSelected {
            DesignSystemAsset.primaryColor.swiftUIColor
        } else {
            DesignSystemAsset.secondaryColor.swiftUIColor.opacity(0.6)
        }
    }
}

#Preview {
    FeelingsSelectionView(viewModel: .preview)
}
