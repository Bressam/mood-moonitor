//
//  FeelingsSelectionViewModel+Preview.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

#if DEBUG
import RegisterMoodTesting

// temp
import RegisterMoodData
import RegisterMoodDomain

extension FeelingsSelectionViewModel {
    @MainActor
    static var preview: FeelingsSelectionViewModel {
        return .init(coordinator: RegisterMoodCoordinatorStub(),
                     retrieveFeelingsUseCase: RetrieveAvailableFeelingsUseCase(repository: FeelingsRepository()))
    }
}
#endif
