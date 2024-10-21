//
//  SignInViewModel.swift
//  SignInFeature
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import Foundation
import SignInFeatureInterface
import SignInDomainInterface

public class SignInViewModel: ObservableObject {
    weak var coordinator: SignInCoordinatorProtocol?
    var loginUseCase: LoginUseCaseProtocol

    public init(coordinator: SignInCoordinatorProtocol, loginUseCase: LoginUseCaseProtocol) {
        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
    }

    func signIn(with credentials: LoginCredentials) async {
        do {
            let authData = try await loginUseCase.execute(with: credentials)
            coordinator?.navigateToSignedInArea()
        } catch {
            print("Failed to login: \(error.localizedDescription)")
        }
    }
}
