//
//  LoginUseCaseStub.swift
//  SignInTesting
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SignInFeatureInterface
import SignInDomainInterface

public final class LoginUseCaseStub: LoginUseCaseProtocol {
    var shouldThrowError: Bool

    public init(shouldThrowError: Bool = false) {
        self.shouldThrowError = shouldThrowError
    }

    public func execute(with credentials: LoginCredentials) async throws -> AuthData {
        guard !shouldThrowError else { throw LoginError.invalidCredentials }
        return .init(authToken: "authToken", refreshToken: "refreshToken")
    }
}

enum LoginError: Error {
    case invalidCredentials
}
