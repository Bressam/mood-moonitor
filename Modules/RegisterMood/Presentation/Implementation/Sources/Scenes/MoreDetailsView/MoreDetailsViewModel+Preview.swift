//
//  MoreDetailsViewModel+Preview.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 27/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

#if DEBUG
import RegisterMoodTesting

extension MoreDetailsViewModel {
    @MainActor
    static var preview: MoreDetailsViewModel {
        return .init(coordinator: RegisterMoodCoordinatorStub(),
                     registerMoodEntryUseCase: RegisterMoodEntryUseCaseStub(),
                     currentMoodEntry: .init(moodLevel: .pleasant, feelings: [], moodDescription: ""))
    }
}
#endif
