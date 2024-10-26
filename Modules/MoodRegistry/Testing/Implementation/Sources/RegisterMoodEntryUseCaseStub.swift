//
//  RegisterMoodEntryUseCaseStub.swift
//  MoodRegistryTesting
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import MoodRegistryFeatureInterface
import MoodRegistryDomainInterface

public final class RegisterMoodEntryUseCaseStub: RegisterMoodEntryUseCaseProtocol {
    var shouldThrowError: Bool

    public init(shouldThrowError: Bool = false) {
        self.shouldThrowError = shouldThrowError
    }

    public func execute(with moodEntry: MoodRegistryEntry) async throws -> MoodRegistryEntry {
        guard !shouldThrowError else { throw MoodEntryError.failedToRetriveRegistry }
        return .init(moodLevel: "", feelings: [], moodDescription: "")
    }
}

enum MoodEntryError: Error {
    case failedToRetriveRegistry
}
