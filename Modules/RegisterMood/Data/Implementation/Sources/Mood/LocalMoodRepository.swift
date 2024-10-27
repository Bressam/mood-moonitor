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
    private let moodEntryKey = "MoodEntryKey"

    public init() {}

    public func saveMood(_ mood: MoodRegistryDomainInterface.MoodEntry) async throws {
        let moodRegistryEntry = MoodRegistryEntry(moodEntry: mood)

        var moodRegistryEntries: [MoodRegistryEntry] = []
        // Read current array
        if let savedData = UserDefaults.standard.data(forKey: moodEntryKey),
           let decodedEntry = try? JSONDecoder().decode([MoodRegistryEntry].self, from: savedData) {
            // Current array exists, keep values
            moodRegistryEntries = decodedEntry
        }
        
        // Append new entry
        moodRegistryEntries.append(moodRegistryEntry)

        // Save updated Entries array
        if let encodedData = try? JSONEncoder().encode(moodRegistryEntries) {
            UserDefaults.standard.set(encodedData, forKey: moodEntryKey)
        }
        return
    }

    public func getAvailableMoods() async throws -> [MoodRegistryDomainInterface.Mood] {
        return Mood.allCases
    }
}
