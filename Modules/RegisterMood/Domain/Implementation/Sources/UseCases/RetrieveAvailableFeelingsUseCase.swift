//
//  RetrieveAvailableFeelingsUseCase.swift
//  RegisterMoodDomain
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodDomainInterface
import MoodRegistryDomainInterface

public class RetrieveAvailableFeelingsUseCase: RetrieveAvailableFeelingsUseCaseProtocol {
    private let repository: FeelingsRepositoryProtocol

    public init(repository: FeelingsRepositoryProtocol) {
        self.repository = repository
    }

    public func execute() async throws -> [Feeling] {
        return try await repository.getAvailableFeelings()
    }
}
