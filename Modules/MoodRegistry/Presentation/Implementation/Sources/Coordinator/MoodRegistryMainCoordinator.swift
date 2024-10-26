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

public class MoodRegistryMainCoordinator: MoodRegistryCoordinatorProtocol {
    public let navigationController: MMNavigationController
    private let registerMoodUseCase: RegisterMoodEntryUseCaseProtocol

    public init(navigationController: MMNavigationController = .init(),
                registerMoodUseCase: RegisterMoodEntryUseCaseProtocol) {
        self.navigationController = navigationController
        self.registerMoodUseCase = registerMoodUseCase
    }

    public func start() {
        navigateToMoodRegistry()
    }

    public func navigateToMoodRegistry() {
        let viewModel = MoodRegistryViewModel(coordinator: self,
                                              registerMoodEntryUseCase: registerMoodUseCase)
        let moodRegistryVC = UIHostingController(rootView: MoodRegistryView(moodRegistryViewModel: viewModel))
        navigationController.pushViewController(moodRegistryVC, animated: true)
    }

    public func navigateToRegisterMood() {
        // TODO: Implement forgot password flow
    }

    public func navigateToRegisterFeelings() {
        // TODO: Implement create account flow
    }
}
