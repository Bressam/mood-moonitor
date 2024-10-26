//
//  MoodRegistryMainCoordinator.swift
//  MoodRegistryFeature
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit
import SwiftUI
import CoordinatorInterface
import MoodRegistryFeatureInterface
import MoodRegistryDomainInterface

// Other Features dependencies
import RegisterMoodFeatureInterface

public class MoodRegistryMainCoordinator: MoodRegistryCoordinatorProtocol {
    public let navigationController: MMNavigationController
    private let retrieveMoodRegistryUseCase: RetrieveMoodRegistryUseCaseProtocol
    private let registerMoodCoordinator: RegisterMoodCoordinatorProtocol

    public init(navigationController: MMNavigationController = .init(),
                retrieveMoodRegistryUseCase: RetrieveMoodRegistryUseCaseProtocol,
                registerMoodCoordinator: RegisterMoodCoordinatorProtocol) {
        self.navigationController = navigationController
        self.retrieveMoodRegistryUseCase = retrieveMoodRegistryUseCase
        self.registerMoodCoordinator = registerMoodCoordinator
    }

    public func start() {
        navigationController.navigationBar.prefersLargeTitles = true
        navigateToMoodRegistry()
    }

    public func navigateToMoodRegistry() {
        let viewModel = MoodRegistryViewModel(coordinator: self,
                                              retrieveMoodRegistryUseCase: retrieveMoodRegistryUseCase)
        let moodRegistryVC = UIHostingController(rootView: MoodRegistryView(moodRegistryViewModel: viewModel))
        navigationController.pushViewController(moodRegistryVC, animated: true)
    }

    public func navigateToRegisterMood() {
        registerMoodCoordinator.navigationController.modalPresentationStyle = .pageSheet
        startChildFlow(with: registerMoodCoordinator)
    }
}
