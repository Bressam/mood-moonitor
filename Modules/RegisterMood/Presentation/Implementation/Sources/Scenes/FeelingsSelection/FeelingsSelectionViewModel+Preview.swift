//
//  FeelingsSelectionViewModel+Preview.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

#if DEBUG
import RegisterMoodTesting

extension FeelingsSelectionViewModel {
    @MainActor
    static var preview: FeelingsSelectionViewModel {
        return .init(coordinator: RegisterMoodCoordinatorStub(),
                     retrieveFeelingsUseCase: RetrieveFeelingsUseCaseStub(),
                     moodEntry: .init(moodLevel: .pleasant, feelings: [], moodDescription: ""))
    }
}
#endif
