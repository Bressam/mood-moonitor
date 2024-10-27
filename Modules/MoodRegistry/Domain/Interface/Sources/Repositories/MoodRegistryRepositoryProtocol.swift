//
//  MoodRegistryRepositoryProtocol.swift
//  MoodRegistryDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

public protocol MoodRegistryRepositoryProtocol: AnyObject {
    func getTodayMoodRegistry() async throws -> MoodRegistryEntry?
    func getMoodRegistry() async throws -> [MoodRegistryEntry]
}
