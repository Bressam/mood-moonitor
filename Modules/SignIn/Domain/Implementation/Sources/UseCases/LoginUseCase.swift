//
//  LoginUseCase.swift
//  SignInDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SignInDomainInterface

public class LoginUseCase: LoginUseCaseProtocol {
    private let repository: AuthDataRepositoryProtocol

    public init(repository: AuthDataRepositoryProtocol) {
        self.repository = repository
    }

    public func login(with credentials: LoginCredentials) async throws -> AuthResult {
        return try await repository.getAuthData()
    }
}
