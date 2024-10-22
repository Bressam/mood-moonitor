//
//  SignInMainCoordinator.swift
//  SignInFeature
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit
import SwiftUI
import CoordinatorInterface
import SignInFeatureInterface
import SignInDomainInterface

public class SignInMainCoordinator: SignInCoordinatorProtocol {
    public let navigationController: MMNavigationController
    public weak var signedInCoordinatorHandler: SignedInCoordinatorHandlerProtocol?
    private let loginUseCase: LoginUseCaseProtocol

    public init(navigationController: MMNavigationController = .init(),
                signedInCoordinatorHandler: SignedInCoordinatorHandlerProtocol,
                loginUseCase: LoginUseCaseProtocol) {
        self.navigationController = navigationController
        self.signedInCoordinatorHandler = signedInCoordinatorHandler
        self.loginUseCase = loginUseCase
    }

    public func start() {
        navigateToSignIn()
    }

    public func navigateToForgotPassword() {
        // TODO: Implement forgot password flow
    }

    public func navigateToSignedInArea() {
        signedInCoordinatorHandler?.handleSignedIn()
    }

    public func navigateToSignIn() {
        let viewModel = SignInViewModel(coordinator: self, loginUseCase: loginUseCase)
        let signInViewController = UIHostingController(rootView: SignInView(signInViewModel: viewModel))
        navigationController.pushViewController(signInViewController, animated: true)
    }
}
