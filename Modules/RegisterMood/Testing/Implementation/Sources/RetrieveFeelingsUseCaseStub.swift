//
//  RetrieveFeelingsUseCaseStub.swift
//  RegisterMoodTesting
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodFeatureInterface
import RegisterMoodDomainInterface
import MoodRegistryDomainInterface

public final class RetrieveFeelingsUseCaseStub: RetrieveAvailableFeelingsUseCaseProtocol {
    var shouldThrowError: Bool

    public init(shouldThrowError: Bool = false) {
        self.shouldThrowError = shouldThrowError
    }

    public func execute() async throws -> [Feeling] {
        guard !shouldThrowError else { throw FeelingRetrieveError.failedToRetriveFeelings }
        return []
    }
}

enum FeelingRetrieveError: Error {
    case failedToRetriveFeelings
}
