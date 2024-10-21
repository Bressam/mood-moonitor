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
    let navigationController: UINavigationController = .init()
    lazy var signInCoordinator: SignInCoordinatorProtocol = {
        let repository = AuthDataRepository(localAuthDataRepository: LocalAuthDataRepository(),
                                            remoteAuthDataRepository: RemoteAuthDataRepository())
        return SignInMainCoordinator(signedInCoordinatorHandler: self,
                                     loginUseCase: LoginUseCase(repository: repository))
    }()
    
    func start() {
        DispatchQueue.main.async {
            self.navigateToSignIn()
        }
    }
    
    func navigateToSignIn() {
        // Uses new NavigationController modally to keep SignIn flow isolated from current navigation controller
        self.signInCoordinator.navigationController.modalPresentationStyle = .fullScreen
        self.navigationController.present(self.signInCoordinator.navigationController, animated: false)

        // Starts new flow
        self.signInCoordinator.start()
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
