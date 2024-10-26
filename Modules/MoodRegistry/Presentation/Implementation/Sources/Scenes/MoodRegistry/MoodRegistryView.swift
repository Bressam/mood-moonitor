//
//  MoodRegistryView.swift
//  MoodRegistry
//
//  Created by Giovanne Bressam on 06/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct MoodRegistryView: View {
    @ObservedObject private var viewModel: MoodRegistryViewModel

    public init(moodRegistryViewModel: MoodRegistryViewModel) {
        self.viewModel = moodRegistryViewModel
    }

    public var body: some View {
        Text("MoodRegistryView")
        MMButton(title: "Register new mood") {
            viewModel.handleAddMoodEntry()
        }
        .navigationTitle("Custom Title") // Set the title here
    }
}

#if DEBUG
#Preview {
    MoodRegistryView(moodRegistryViewModel: .preview)
}
#endif
