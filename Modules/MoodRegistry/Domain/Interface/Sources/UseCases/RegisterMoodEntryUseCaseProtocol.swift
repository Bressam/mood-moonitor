//
//  RegisterMoodEntryUseCaseProtocol.swift
//  MoodRegistryDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

public protocol RegisterMoodEntryUseCaseProtocol: AnyObject {
    func execute(with moodEntry: MoodRegistryEntry) async throws -> MoodRegistryEntry
}
