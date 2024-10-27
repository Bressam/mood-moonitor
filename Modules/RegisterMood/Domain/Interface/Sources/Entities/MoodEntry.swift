//
//  MoodEntry.swift
//  RegisterMoodDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

public struct MoodEntry {
    public var moodLevel: Mood
    public var feelings: [Feeling]
    public var moodDescription: String

    public init (moodLevel: Mood, feelings: [Feeling], moodDescription: String) {
        self.moodLevel = moodLevel
        self.feelings = feelings
        self.moodDescription = moodDescription
    }
}
