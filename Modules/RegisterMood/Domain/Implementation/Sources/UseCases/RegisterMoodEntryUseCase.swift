//
//  RegisterMoodEntryUseCase.swift
//  RegisterMoodDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodDomainInterface

public class RegisterMoodEntryUseCase: RegisterMoodEntryUseCaseProtocol {
    private let repository: MoodRepositoryProtocol

    public init(repository: MoodRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(with moodEntry: MoodEntry) async throws {
        return try await repository.saveMood(moodEntry)
    }
}
