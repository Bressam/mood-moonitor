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
        let repository = RegisterMoodRepository()
        return RegisterMoodMainCoordinator(registerMoodUseCase: RegisterMoodEntryUseCase(repository: repository))
    }
}
