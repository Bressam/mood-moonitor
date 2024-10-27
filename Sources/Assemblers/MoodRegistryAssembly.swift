//
//  MoodRegistryAssembly.swift
//  MoodMoonitorApp
//
//  Created by Giovanne Bressam on 25/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import MoodRegistryFeatureInterface
import MoodRegistryFeature
import MoodRegistryDomain
import MoodRegistryData

// Features
import RegisterMoodFeatureInterface

class MoodRegistryCoordinatorAssembly {
    @MainActor
    static func assemble(registerMoodCoordinator: RegisterMoodCoordinatorProtocol) -> MoodRegistryCoordinatorProtocol {
        let repository = MoodRegistryRepository(localAuthDataRepository: LocalMoodRegistryRepository(),
                                                remoteAuthDataRepository: RemoteMoodRegistryRepository())
        
        return MoodRegistryMainCoordinator(retrieveMoodRegistryUseCase: RetrieveMoodRegistryUseCase(repository: repository),
                                           registerMoodCoordinator: registerMoodCoordinator)
    }
}
