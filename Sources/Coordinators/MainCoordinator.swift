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
        SignInMainCoordinator(navigationController: navigationController,
                              signedInCoordinatorHandler: self)
    }()
    
    func start() {
        signInCoordinator.start()
    }
    
    func navigateToSignedInArea() {
        print("Signed In!")
    }
}

extension MainCoordinator: SignedInCoordinatorHandlerProtocol {
    func handleSignedIn() {
        navigateToSignedInArea()
    }
}
