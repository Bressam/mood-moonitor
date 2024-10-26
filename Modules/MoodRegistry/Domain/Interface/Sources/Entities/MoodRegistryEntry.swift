//
//  MoodRegistryEntry.swift
//  MoodRegistryDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

public struct MoodRegistryEntry {
    public let moodLevel: String
    public let feelings: [String]
    public let moodDescription: String

    public init (moodLevel: String, feelings: [String], moodDescription: String) {
        self.moodLevel = moodLevel
        self.feelings = feelings
        self.moodDescription = moodDescription
    }
}
