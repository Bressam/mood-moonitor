//
//  RemoteMoodRegistryRepository.swift
//  MoodRegistryData
//
//  Created by Giovanne Bressam on 15/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import MoodRegistryDomainInterface

public class RemoteMoodRegistryRepository: MoodRegistryRepositoryProtocol {
    public init() {}

    public func getMoodRegistry() async throws -> MoodRegistryDomainInterface.MoodRegistryEntry {
        try await Task.sleep(for: .seconds(2))
        return .init(moodLevel: "", feelings: [], moodDescription: "")
    }
}
