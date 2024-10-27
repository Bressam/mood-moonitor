//
//  FeelingsRepository.swift
//  RegisterMoodData
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodDomainInterface
import MoodRegistryDomainInterface

public class FeelingsRepository: FeelingsRepositoryProtocol {
    public init() {}
    public func getAvailableFeelings() async throws -> [Feeling] {
        let feelings: [String] = [
            "Amazed",
            "Amused",
            "Angry",
            "Annoyed",
            "Anxious",
            "Ashamed",
            "Brave",
            "Calm",
            "Confident",
            "Content",
            "Disappointed",
            "Discouraged",
            "Disgusted",
            "Drained",
            "Embarrassed",
            "Excited",
            "Frustrated",
            "Grateful",
            "Guilty",
            "Happy",
            "Hopeful",
            "Hopeless",
            "Indifferent",
            "Irritated",
            "Jealous",
            "Joyful",
            "Lonely",
            "Overwhelmed",
            "Passionate",
            "Peaceful",
            "Proud",
            "Relieved",
            "Sad",
            "Satisfied",
            "Scared",
            "Stressed",
            "Surprised",
            "Worried"
        ]

        return feelings.map { .init(name: $0) }
    }
}
