//
//  MainCoordinator.swift
//  MoodMoonitor
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit
import SwiftUI
import CoordinatorInterface

// SignIn Feature
import SignInFeatureInterface
// RegisterEntry Feature
import MoodRegistryFeatureInterface
// MoodRegister Feature
import RegisterMoodFeatureInterface

class MainCoordinator: CoordinatorProtocol {
    // MARK: - Properties
    let navigationController: MMNavigationController = .init()
    
    // MARK: - Features Assemblers
    lazy var signInCoordinator: SignInCoordinatorProtocol = {
        SignInCoordinatorAssembly.assemble(signedInCoordinatorHandler: self)
    }()

    lazy var moodRegistryCoordinator: MoodRegistryCoordinatorProtocol = {
        MoodRegistryCoordinatorAssembly.assemble(registerMoodCoordinator: registerMoodCoordinator)
    }()

    lazy var registerMoodCoordinator: RegisterMoodCoordinatorProtocol = {
        RegisterMoodAssembly.assemble()
    }()

    // MARK: - Lifecycle and Flow
    func start() {
        navigateToSignIn()
    }
    
    func navigateToSignIn() {
        startChildFlow(with: signInCoordinator, animated: false)
    }

    func navigateToSignedInArea() {
        startChildFlow(with: moodRegistryCoordinator)
    }
}

// MARK: - SignIn feature callback
extension MainCoordinator: SignedInCoordinatorHandlerProtocol {
    func handleSignedIn() {
        Task {
            await MainActor.run { [weak self] in
                self?.signInCoordinator.dismiss(animated: false)
                self?.navigateToSignedInArea()
            }
        }
    }
}
