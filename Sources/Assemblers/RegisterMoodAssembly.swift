//
//  RegisterMoodAssembly.swift
//  MoodMoonitorApp
//
//  Created by Giovanne Bressam on 25/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodFeatureInterface
import RegisterMoodFeature
import RegisterMoodDomain
import RegisterMoodData

class RegisterMoodAssembly {
    @MainActor
    static func assemble() -> RegisterMoodCoordinatorProtocol {
        let moodRepository = MoodRepository(localMoodRepository: LocalMoodRepository(),
                                            remoteMoodRepository: RemoteMoodRepository())
        let feelingsRepostory = FeelingsRepository()
        return RegisterMoodMainCoordinator(registerMoodUseCase: RegisterMoodEntryUseCase(repository: moodRepository),
                                           retrieveMoodUseCase: RetrieveAvailableMoodsUseCase(repository: moodRepository),
                                           retrieveFeelingsUseCase: RetrieveAvailableFeelingsUseCase(repository: feelingsRepostory))
    }
}
