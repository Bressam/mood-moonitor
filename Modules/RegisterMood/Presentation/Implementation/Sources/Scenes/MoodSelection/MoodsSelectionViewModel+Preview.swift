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

extension MoodsSelectionViewModel {
    @MainActor
    static var preview: MoodsSelectionViewModel {
        return .init(coordinator: RegisterMoodCoordinatorStub(),
                     retrieveMoodsUseCase: RetrieveMoodsUseCaseStub())
    }
}
#endif
