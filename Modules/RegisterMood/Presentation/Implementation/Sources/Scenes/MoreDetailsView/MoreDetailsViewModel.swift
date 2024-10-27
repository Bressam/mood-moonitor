//
//  MoreDetailsViewModel.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 27/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import Foundation
import RegisterMoodFeatureInterface
import RegisterMoodDomainInterface

class MoreDetailsViewModel: ObservableObject {
    private let coordinator: RegisterMoodCoordinatorProtocol
    private let registerMoodEntryUseCase: RegisterMoodEntryUseCaseProtocol
    @Published var moodDetailsEntry: String
    private var currentMoodEntry: MoodEntry

    @MainActor
    @Published var isloading: Bool = false

    init(coordinator: RegisterMoodCoordinatorProtocol,
         registerMoodEntryUseCase: RegisterMoodEntryUseCaseProtocol,
         currentMoodEntry: MoodEntry) {
        self.coordinator = coordinator
        self.registerMoodEntryUseCase = registerMoodEntryUseCase
        self.currentMoodEntry = currentMoodEntry
        self.moodDetailsEntry = currentMoodEntry.moodDescription
    }

    func registerMoodEntry() async {
        setLoading(to: true)
        currentMoodEntry.moodDescription = moodDetailsEntry
        do {
            try await registerMoodEntryUseCase.execute(with: currentMoodEntry)
            setLoading(to: false)
        } catch {
            print("Failed to log mood entry: \(error.localizedDescription)")
            setLoading(to: false)
        }
    }

    private func setLoading(to isLoading: Bool) {
        Task {
            await MainActor.run {
                isloading = isLoading
            }
        }
    }
}
