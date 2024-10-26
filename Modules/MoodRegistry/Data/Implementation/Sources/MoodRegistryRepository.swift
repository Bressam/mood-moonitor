//
//  MoodRegistryRepository.swift
//  MoodRegistryData
//
//  Created by Giovanne Bressam on 15/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import MoodRegistryDomainInterface

public class MoodRegistryRepository: MoodRegistryRepositoryProtocol {
    private let localMoodRegistryRepository: MoodRegistryRepositoryProtocol
    private let remoteMoodRegistryRepository: MoodRegistryRepositoryProtocol

    public init(localAuthDataRepository: MoodRegistryRepositoryProtocol,
                remoteAuthDataRepository: MoodRegistryRepositoryProtocol) {
        self.localMoodRegistryRepository = localAuthDataRepository
        self.remoteMoodRegistryRepository = remoteAuthDataRepository
    }

    public func getMoodRegistry() async throws -> MoodRegistryDomainInterface.MoodRegistryEntry {
        do {
            return try await remoteMoodRegistryRepository.getMoodRegistry()
        } catch {
            // Fallback to local data
            return try await localMoodRegistryRepository.getMoodRegistry()
        }
    }
}
