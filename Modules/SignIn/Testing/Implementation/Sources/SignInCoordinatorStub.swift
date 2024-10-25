//
//  SignInCoordinatorStub.swift
//  SignInTesting
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SignInFeatureInterface
import CoordinatorInterface

public final class SignInCoordinatorStub: SignInCoordinatorProtocol {
    public var signedInCoordinatorHandler: SignedInCoordinatorHandlerProtocol?
    public var navigationController: MMNavigationController = .init()

    public init() {}

    public func start() {
        print("SignInCoordinatorStub: start")
    }

    public func navigateToForgotPassword() {
        print("SignInCoordinatorStub: navigateToForgotPassword")
    }

    public func navigateToSignIn() {
        print("SignInCoordinatorStub: navigateToSignIn")
    }

    public func navigateToSignedInArea() {
        print("SignInCoordinatorStub: navigateToSignedInArea")
    }

    public func navigateToAccountCreation() {
        print("SignInCoordinatorStub: navigateToAccountCreation")
    }
}
