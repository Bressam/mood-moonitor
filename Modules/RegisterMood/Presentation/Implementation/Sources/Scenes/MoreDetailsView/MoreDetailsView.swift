//
//  MoreDetailsView.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 27/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI

struct MoreDetailsView: View {
    // MARK: - Properties
    @ObservedObject
    private var viewModel: MoreDetailsViewModel

    // MARK: - Setup
    init(viewModel: MoreDetailsViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Views
    var body: some View { Text("MoreDetailsView") }
}

#Preview {
    MoreDetailsView(viewModel: .preview)
}
