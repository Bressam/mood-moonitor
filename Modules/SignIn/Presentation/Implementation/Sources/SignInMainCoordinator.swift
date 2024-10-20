//
//  SignInMainCoordinator.swift
//  SignInFeature
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit
import SwiftUI
import SignInFeatureInterface

class SignInMainCoordinator: SignInCoordinatorProtocol {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigateToSignIn()
    }
    
    func navigateToForgotPassword() {
        // TODO: Implement forgot password flow
    }
    
    func navigateToSignIn() {
        let signInViewController = UIHostingController(rootView: SignInView())
        navigationController.pushViewController(signInViewController, animated: true)
    }
}
