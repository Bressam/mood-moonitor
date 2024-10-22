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
import SignInFeatureInterface
import SignInFeature

class MainCoordinator: CoordinatorProtocol {
    let navigationController: MMNavigationController = .init()
    lazy var signInCoordinator: SignInCoordinatorProtocol = {
        let repository = AuthDataRepository(localAuthDataRepository: LocalAuthDataRepository(),
                                            remoteAuthDataRepository: RemoteAuthDataRepository())
        return SignInMainCoordinator(signedInCoordinatorHandler: self,
                                     loginUseCase: LoginUseCase(repository: repository))
    }()
    
    func start() {
        navigateToSignIn()
    }
    
    func navigateToSignIn() {
        // Setup new flow presentation style
        navigationController.present(signInCoordinator.navigationController, animated: false)

        // Starts new flow
        signInCoordinator.start()
    }

    func navigateToSignedInArea() {
        print("Signed In!")
    }
}

extension MainCoordinator: SignedInCoordinatorHandlerProtocol {
    func handleSignedIn() {
        Task {
            await MainActor.run { [weak self] in
                self?.signInCoordinator.dismiss()
                self?.navigateToSignedInArea()
            }
        }
    }
}
