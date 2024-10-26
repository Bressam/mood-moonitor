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

    public init(navigationController: MMNavigationController = .init(),
                registerMoodUseCase: RegisterMoodEntryUseCaseProtocol) {
        self.navigationController = navigationController
        self.registerMoodUseCase = registerMoodUseCase
    }

    public func start() {
        navigateToMood()
    }

    public func navigateToMood() {
        print("navigateToMood")
        navigateToFeelings()
    }

    public func navigateToFeelings() {
        let moodRegistryVC = UIHostingController(rootView: FeelingsSelectionView(items: [], onContinue: { feelings in
            print("Coordinator received feelings: \(feelings)")
        }))
        navigationController.pushViewController(moodRegistryVC, animated: true)
    }

    public func navigateToAddDetails() {
        print("navigateToAddDetails")
    }
}
