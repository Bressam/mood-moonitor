//
//  MoodRegistryEntry.swift
//  MoodRegistryDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import Foundation

public struct MoodRegistryEntry: Codable {
    public let date: Date?
    public let moodEntry: MoodEntry

    public init(date: Date? = Date(), moodEntry: MoodEntry) {
        self.date = date
        self.moodEntry = moodEntry
    }
}
