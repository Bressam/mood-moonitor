//
//  FeelingsRepositoryProtocol.swift
//  RegisterMoodDomain
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import MoodRegistryDomainInterface

public protocol FeelingsRepositoryProtocol {
    func getAvailableFeelings() async throws -> [Feeling]
}
