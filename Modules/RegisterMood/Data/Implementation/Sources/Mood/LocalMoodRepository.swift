//
//  LocalMoodRepository.swift
//  RegisterMoodData
//
//  Created by Giovanne Bressam on 27/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import Foundation
import MoodRegistryDomainInterface
import RegisterMoodDomainInterface

public class LocalMoodRepository: MoodRepositoryProtocol {
    private let moodEntriesKey = "MoodEntriesKey"

    public init() {}

    public func saveMood(_ mood: MoodRegistryDomainInterface.MoodEntry) async throws {
        let moodRegistryEntry = MoodRegistryEntry(moodEntry: mood)
        if let encodedData = try? JSONEncoder().encode(moodRegistryEntry) {
            UserDefaults.standard.set(encodedData, forKey: moodEntriesKey)
        }
        return
    }

    public func getAvailableMoods() async throws -> [MoodRegistryDomainInterface.Mood] {
        return Mood.allCases
    }
}
