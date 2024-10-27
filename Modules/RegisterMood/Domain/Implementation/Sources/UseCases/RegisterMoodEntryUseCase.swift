//
//  RegisterMoodEntryUseCase.swift
//  RegisterMoodDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodDomainInterface
import MoodRegistryDomainInterface

public class RegisterMoodEntryUseCase: RegisterMoodEntryUseCaseProtocol {
    private let repository: MoodRepositoryProtocol

    public init(repository: MoodRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(with moodEntry: MoodEntry) async throws {
        try await Task.sleep(for: .seconds(2.5))
        return try await repository.saveMood(moodEntry)
    }
}
