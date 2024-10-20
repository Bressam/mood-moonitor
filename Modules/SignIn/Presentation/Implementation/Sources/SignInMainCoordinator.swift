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

public class SignInMainCoordinator: SignInCoordinatorProtocol {
    public let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func start() {
        navigateToSignIn()
    }

    public func navigateToForgotPassword() {
        // TODO: Implement forgot password flow
    }

    public func navigateToSignIn() {
        let signInViewController = UIHostingController(rootView: SignInView())
        navigationController.pushViewController(signInViewController, animated: true)
    }
}
