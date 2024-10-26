//
//  RetrieveMoodRegistryUseCaseStub.swift
//  MoodRegistryTesting
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import MoodRegistryFeatureInterface
import MoodRegistryDomainInterface

public final class RetrieveMoodRegistryUseCaseStub: RetrieveMoodRegistryUseCaseProtocol {
    var shouldThrowError: Bool

    public init(shouldThrowError: Bool = false) {
        self.shouldThrowError = shouldThrowError
    }

    public func execute() async throws -> [MoodRegistryEntry] {
        guard !shouldThrowError else { throw MoodEntryError.failedToRetriveRegistry }
        return []
    }
}

enum MoodEntryError: Error {
    case failedToRetriveRegistry
}
