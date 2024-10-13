//
//  LoginUseCase.swift
//  SignInDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SignInDomainInterface

class LoginUseCase: LoginUseCaseProtocol {
    func login(with credentials: LoginCredentials) async throws -> LoginResult {
        return .init()
    }
}
