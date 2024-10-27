//
//  MoreDetailsView.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 27/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct MoreDetailsView: View {
    // MARK: - Properties
    @ObservedObject
    private var viewModel: MoreDetailsViewModel

    // MARK: - Setup
    init(viewModel: MoreDetailsViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Views
    var body: some View {
        ZStack {
            gradientBackground
            if viewModel.isloading {
                LoadingIndicatorView(style: .rocket)
            } else {
                contentView
            }
        }
    }

    private var contentView: some View {
        VStack(spacing: SpacingTokens.large.constant) {
            currentMoodView
            moodDescriptionTextField
            Spacer()
            MMButton(title: "Send") {
                Task {
                    await viewModel.registerMoodEntry()
                }
            }
        }
    }

    private var moodDescriptionTextField: some View {
        VStack(spacing: SpacingTokens.small.constant) {
            HStack {
                Text("Enter your mood")
                    .font(.appBodyFont.bold())
                    .foregroundStyle(DesignSystemAsset.secondaryColor.swiftUIColor)
                Spacer()
            }
            TextEditor(text: $viewModel.moodDetailsEntry)
                .foregroundStyle(.purple)
                .padding(6)
                .background(
                    RoundedRectangle(cornerRadius: RadiusTokens.regular.constant)
                        .fill(.white)
                )
        }.padding([.leading, .trailing])
    }

    private var currentMoodView: some View {
        MoodGradientView(currentMood: .constant(viewModel.currentMoodEntry.moodLevel),
                         style: .playOnce,
                         hasShadow: false)
        .padding([.top], SpacingTokens.large.constant)
    }

    private var gradientBackground: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                Gradient.Stop(color: MoodGradientView.getColor(for: viewModel.currentMoodEntry.moodLevel),
                              location: 0.3),
                Gradient.Stop(color: DesignSystemAsset.backgroundLightBlue.swiftUIColor.opacity(0.6),
                              location: 1)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .opacity(0.55)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MoreDetailsView(viewModel: .preview)
}
