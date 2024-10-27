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
        VStack {
            Text("MoreDetailsView")
            MMButton(title: "Send") {
                Task {
                    await viewModel.registerMoodEntry()
                }
            }
        }
    }

    private var gradientBackground: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                Gradient.Stop(color: DesignSystemAsset.backgroundLightBlue.swiftUIColor.opacity(0.6),
                              location: 0.14)
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
