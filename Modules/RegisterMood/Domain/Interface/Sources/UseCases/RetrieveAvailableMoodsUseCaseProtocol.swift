//
//  RetrieveAvailableMoodsUseCaseProtocol.swift
//  RegisterMoodDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import MoodRegistryDomainInterface

public protocol RetrieveAvailableMoodsUseCaseProtocol: AnyObject {
    func execute() async throws -> [Mood]
}
