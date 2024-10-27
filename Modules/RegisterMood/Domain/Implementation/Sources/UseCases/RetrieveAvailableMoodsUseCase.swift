//
//  RetrieveAvailableMoodsUseCase.swift
//  RegisterMoodDomain
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodDomainInterface
import MoodRegistryDomainInterface

public class RetrieveAvailableMoodsUseCase: RetrieveAvailableMoodsUseCaseProtocol {
    private let repository: MoodRepositoryProtocol

    public init(repository: MoodRepositoryProtocol) {
        self.repository = repository
    }

    public func execute() async throws -> [Mood] {
        return try await repository.getAvailableMoods()
    }
}
