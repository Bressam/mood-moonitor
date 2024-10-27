//
//  MoodsSelectionViewModel.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import Foundation
import RegisterMoodFeatureInterface
import RegisterMoodDomainInterface
import MoodRegistryDomainInterface

public class MoodsSelectionViewModel: ObservableObject {
    // MARK: - Properties
    private weak var coordinator: RegisterMoodCoordinatorProtocol?
    private let retrieveMoodsUseCase: RetrieveAvailableMoodsUseCaseProtocol
    private var currentMoodEntry: MoodEntry = .init(moodLevel: .neutral, feelings: [], moodDescription: "")
    private var availableMoods: [Mood] = []
    @Published var selectedMood: Mood = .neutral

    // MARK: - Init
    public init(coordinator: RegisterMoodCoordinatorProtocol?,
                retrieveMoodsUseCase: RetrieveAvailableMoodsUseCaseProtocol) {
        self.coordinator = coordinator
        self.retrieveMoodsUseCase = retrieveMoodsUseCase
    }

    // MARK: - Data Related
    func fetchAvailableFeelings() async {
        let fetchedMoods = (try? await retrieveMoodsUseCase.execute()) ?? []
        await MainActor.run {
            availableMoods = fetchedMoods
        }
    }

    // MARK: - Navigation
    public func handleFinishSelectedFeelings() {
        print("CurrentMood: \(selectedMood)")
        currentMoodEntry.moodLevel = selectedMood
        coordinator?.navigateToFeelings(carrying: currentMoodEntry)
    }

    @MainActor
    func dismiss() {
        coordinator?.dismiss(animated: true)
    }
}
