//
//  RetrieveMoodRegistryUseCase.swift
//  MoodRegistryDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import MoodRegistryDomainInterface

public class RetrieveMoodRegistryUseCase: RetrieveMoodRegistryUseCaseProtocol {
    private let repository: MoodRegistryRepositoryProtocol

    public init(repository: MoodRegistryRepositoryProtocol) {
        self.repository = repository
    }

    public func execute() async throws -> [MoodRegistryEntry] {
        return try await repository.getMoodRegistry()
    }
}
