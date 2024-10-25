//
//  SignInCoordinator.swift
//  SignInFeature
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//
import CoordinatorInterface

public protocol SignInCoordinatorProtocol: CoordinatorProtocol {
    var signedInCoordinatorHandler: SignedInCoordinatorHandlerProtocol? { get }

    func navigateToForgotPassword()
    func navigateToSignIn()
    func navigateToAccountCreation()
    func navigateToSignedInArea()
}
