//
//  MoodRepository.swift
//  RegisterMoodData
//
//  Created by Giovanne Bressam on 15/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodDomainInterface
import MoodRegistryDomainInterface

public class MoodRepository: MoodRepositoryProtocol {
    let localMoodRepository: MoodRepositoryProtocol
    let remoteMoodRepository: MoodRepositoryProtocol

    public init(localMoodRepository: MoodRepositoryProtocol, remoteMoodRepository: MoodRepositoryProtocol) {
        self.localMoodRepository = localMoodRepository
        self.remoteMoodRepository = remoteMoodRepository
    }

    public func saveMood(_ mood: MoodRegistryDomainInterface.MoodEntry) async throws {
        try await localMoodRepository.saveMood(mood)
        try await remoteMoodRepository.saveMood(mood)
        return
    }

    public func getAvailableMoods() async throws -> [MoodRegistryDomainInterface.Mood] {
        do {
            return try await remoteMoodRepository.getAvailableMoods()
        } catch {
            // Fallback to local data
            return try await localMoodRepository.getAvailableMoods()
        }
    }
}
