//
//  RegisterMoodEntryUseCaseStub.swift
//  RegisterMoodTesting
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodFeatureInterface
import RegisterMoodDomainInterface
import MoodRegistryDomainInterface

public final class RegisterMoodEntryUseCaseStub: RegisterMoodEntryUseCaseProtocol {
    var shouldThrowError: Bool

    public init(shouldThrowError: Bool = false) {
        self.shouldThrowError = shouldThrowError
    }

    public func execute(with moodEntry: MoodEntry) async throws {
        guard !shouldThrowError else { throw MoodEntryError.failedToRetriveRegistry }
    }
}

enum MoodEntryError: Error {
    case failedToRetriveRegistry
}
