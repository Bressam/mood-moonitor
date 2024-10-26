//
//  MoodRegistryViewModel.swift
//  MoodRegistryFeature
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import Foundation
import MoodRegistryFeatureInterface
import MoodRegistryDomainInterface

public class MoodRegistryViewModel: ObservableObject {
    private weak var coordinator: MoodRegistryCoordinatorProtocol?
    private var registerMoodEntryUseCase: RegisterMoodEntryUseCaseProtocol

    @MainActor
    @Published var isloading: Bool = false

    public init(coordinator: MoodRegistryCoordinatorProtocol,
                registerMoodEntryUseCase: RegisterMoodEntryUseCaseProtocol) {
        self.coordinator = coordinator
        self.registerMoodEntryUseCase = registerMoodEntryUseCase
    }

    private func handleAddMoodEntry() {
        print("handleAddMoodEntry!")
    }
}
