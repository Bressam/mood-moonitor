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


class MainCoordinator: CoordinatorProtocol {
    // MARK: - Properties
    let navigationController: MMNavigationController = .init()
    lazy var signInCoordinator: SignInCoordinatorProtocol = {
        SignInCoordinatorAssembly.assemble(signedInCoordinatorHandler: self)
    }()
    
    func start() {
        navigateToSignIn()
    }
    
    func navigateToSignIn() {
        startChildFlow(with: signInCoordinator)
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
