//
//  RegisterMoodMainCoordinator.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit
import SwiftUI
import CoordinatorInterface
import RegisterMoodFeatureInterface
import RegisterMoodDomainInterface
import MoodRegistryDomainInterface

public class RegisterMoodMainCoordinator: RegisterMoodCoordinatorProtocol {
    public let navigationController: MMNavigationController
    private let registerMoodUseCase: RegisterMoodEntryUseCaseProtocol
    private let retrieveMoodUseCase: RetrieveAvailableMoodsUseCaseProtocol
    private let retrieveFeelingsUseCase: RetrieveAvailableFeelingsUseCaseProtocol

    public init(navigationController: MMNavigationController = .init(),
                registerMoodUseCase: RegisterMoodEntryUseCaseProtocol,
                retrieveMoodUseCase: RetrieveAvailableMoodsUseCaseProtocol,
                retrieveFeelingsUseCase: RetrieveAvailableFeelingsUseCaseProtocol) {
        self.navigationController = navigationController
        self.registerMoodUseCase = registerMoodUseCase
        self.retrieveMoodUseCase = retrieveMoodUseCase
        self.retrieveFeelingsUseCase = retrieveFeelingsUseCase
    }

    public func start() {
        navigateToMood()
    }

    public func navigateToMood() {
        let viewModel = MoodsSelectionViewModel(coordinator: self,
                                                retrieveMoodsUseCase: retrieveMoodUseCase)
        let moodRegistryVC = UIHostingController(rootView: MoodsSelectionView(viewModel: viewModel))
        navigationController.pushViewController(moodRegistryVC, animated: true)
    }

    public func navigateToFeelings(carrying moodEntry: MoodEntry) {
        let viewModel = FeelingsSelectionViewModel(coordinator: self,
                                                   retrieveFeelingsUseCase: retrieveFeelingsUseCase,
                                                   moodEntry: moodEntry)
        let moodRegistryVC = UIHostingController(rootView: FeelingsSelectionView(viewModel: viewModel))
        navigationController.pushViewController(moodRegistryVC, animated: true)
    }

    public func navigateToAddDetails(carrying moodEntry: MoodEntry) {
        let viewModel = MoreDetailsViewModel(coordinator: self,
                                             registerMoodEntryUseCase: registerMoodUseCase,
                                             currentMoodEntry: moodEntry)
        let moodRegistryVC = UIHostingController(rootView: MoreDetailsView(viewModel: viewModel))
        navigationController.pushViewController(moodRegistryVC, animated: true)
    }
}
