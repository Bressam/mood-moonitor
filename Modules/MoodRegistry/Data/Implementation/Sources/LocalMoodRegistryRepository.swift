//
//  LocalMoodRegistryRepository.swift
//  MoodRegistryData
//
//  Created by Giovanne Bressam on 15/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import Foundation
import MoodRegistryDomainInterface

public class LocalMoodRegistryRepository: MoodRegistryRepositoryProtocol {
    private let moodEntryKey = "MoodEntryKey"

    public init() {}

    public func getTodayMoodRegistry() async throws -> MoodRegistryDomainInterface.MoodRegistryEntry? {
        guard let savedData = UserDefaults.standard.data(forKey: moodEntryKey),
              let decodedEntry = try? JSONDecoder().decode([MoodRegistryEntry].self, from: savedData) else {
            return nil
        }
        return decodedEntry.first(where: {$0.date == Date()})
    }

    public func getMoodRegistry() async throws -> [MoodRegistryDomainInterface.MoodRegistryEntry] {
        guard let savedData = UserDefaults.standard.data(forKey: moodEntryKey),
              let decodedEntry = try? JSONDecoder().decode([MoodRegistryEntry].self, from: savedData) else {
            return []
        }
        return decodedEntry
    }
}
