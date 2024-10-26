//
//  MoodRegistryViewModel+Preview.swift
//  MoodRegistryFeature
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

#if DEBUG
import MoodRegistryTesting

extension MoodRegistryViewModel {
    @MainActor
    static var preview: MoodRegistryViewModel {
        return .init(coordinator: MoodRegistryCoordinatorStub(),
                     retrieveMoodRegistryUseCase: RetrieveMoodRegistryUseCaseStub())
    }
}
#endif
