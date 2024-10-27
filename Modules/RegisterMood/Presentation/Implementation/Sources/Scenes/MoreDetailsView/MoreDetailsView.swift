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
        if viewModel.isloading {
            LoadingIndicatorView(style: .rocket)
        } else {
            Text("MoreDetailsView")
            MMButton(title: "Send") {
                Task {
                    await viewModel.registerMoodEntry()
                }
            }
        }
    }
}

#Preview {
    MoreDetailsView(viewModel: .preview)
}
