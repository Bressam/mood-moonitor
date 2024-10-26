//
//  MoodRepository.swift
//  RegisterMoodData
//
//  Created by Giovanne Bressam on 15/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodDomainInterface

public class MoodRepository: MoodRepositoryProtocol {
    public init() {}

    public func saveMood(_ mood: RegisterMoodDomainInterface.MoodEntry) async throws {
        try await Task.sleep(for: .seconds(2))
        return
    }

    public func getAvailableMoods() async throws -> [RegisterMoodDomainInterface.Mood] {
        return []
    }
}
