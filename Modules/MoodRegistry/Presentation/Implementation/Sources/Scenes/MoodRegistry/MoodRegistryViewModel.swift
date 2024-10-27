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

protocol MoodRegistryRefreshDelegate: AnyObject {
    func refreshMoodRegistry()
}

public class MoodRegistryViewModel: ObservableObject {
    private weak var coordinator: MoodRegistryCoordinatorProtocol?
    private let retrieveMoodRegistryUseCase: RetrieveMoodRegistryUseCaseProtocol
    @MainActor
    @Published var moodRegistry: [MoodRegistryEntry] = []

    @MainActor
    @Published var todayMoodRegistry: MoodRegistryEntry?

    public init(coordinator: MoodRegistryCoordinatorProtocol,
                retrieveMoodRegistryUseCase: RetrieveMoodRegistryUseCaseProtocol) {
        self.coordinator = coordinator
        self.retrieveMoodRegistryUseCase = retrieveMoodRegistryUseCase
    }

    public func handleAddMoodEntry() {
        coordinator?.navigateToRegisterMood()
    }

    func fetchMoodRegistry() async {
        let moodRegistryFetch = try? await retrieveMoodRegistryUseCase.execute()
        await MainActor.run {
            var moodList = moodRegistryFetch
            let todayMood = moodRegistryFetch?.last(where: { isToday($0.date) })
            if let todayMoodIndex = moodRegistryFetch?.firstIndex(where: { isToday($0.date) }) {
                moodList?.remove(at: todayMoodIndex)
            }
            todayMoodRegistry = todayMood
            moodRegistry = moodList ?? []
        }
    }

    private func isToday(_ date: Date?) -> Bool {
        guard let date else { return false }
        return Calendar.current.isDateInToday(date)
    }
}

extension MoodRegistryViewModel: MoodRegistryRefreshDelegate {
    func refreshMoodRegistry() {
        Task {
            await fetchMoodRegistry()
        }
    }
}
