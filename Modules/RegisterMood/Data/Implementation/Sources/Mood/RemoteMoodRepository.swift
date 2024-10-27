//
//  RemoteMoodRepository.swift
//  RegisterMoodData
//
//  Created by Giovanne Bressam on 27/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodDomainInterface
import MoodRegistryDomainInterface

public class RemoteMoodRepository: MoodRepositoryProtocol {
    public init() {}

    public func saveMood(_ mood: MoodRegistryDomainInterface.MoodEntry) async throws {
        try await Task.sleep(for: .seconds(2))
        return
    }

    public func getAvailableMoods() async throws -> [MoodRegistryDomainInterface.Mood] {
        throw(RemoteMoodRepositoryError.timeout)
    }
}

enum RemoteMoodRepositoryError: Error {
    case timeout
}
