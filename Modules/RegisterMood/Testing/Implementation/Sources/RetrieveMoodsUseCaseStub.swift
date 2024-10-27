//
//  RetrieveMoodsUseCaseStub.swift
//  RegisterMoodTesting
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodFeatureInterface
import RegisterMoodDomainInterface

public final class RetrieveMoodsUseCaseStub: RetrieveAvailableMoodsUseCaseProtocol {
    var shouldThrowError: Bool

    public init(shouldThrowError: Bool = false) {
        self.shouldThrowError = shouldThrowError
    }

    public func execute() async throws -> [Mood] {
        guard !shouldThrowError else { throw MoodRetrieveError.failedToRetriveMoods }
        return Mood.allCases
    }
}

enum MoodRetrieveError: Error {
    case failedToRetriveMoods
}
