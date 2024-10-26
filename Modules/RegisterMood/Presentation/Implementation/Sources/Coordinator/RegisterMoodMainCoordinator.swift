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
        print("navigateToMood")
        navigateToFeelings()
    }

    public func navigateToFeelings() {
        let viewModel = FeelingsSelectionViewModel(coordinator: self,
                                                   retrieveFeelingsUseCase: retrieveFeelingsUseCase)
        let moodRegistryVC = UIHostingController(rootView: FeelingsSelectionView(viewModel: viewModel))
        navigationController.pushViewController(moodRegistryVC, animated: true)
    }

    public func navigateToAddDetails() {
        print("navigateToAddDetails")
    }
}
