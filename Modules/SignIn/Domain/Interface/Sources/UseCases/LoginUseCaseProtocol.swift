//
//  LoginUseCaseProtocol.swift
//  SignInDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

public protocol LoginUseCaseProtocol: AnyObject {
    func execute(with credentials: LoginCredentials) async throws -> AuthData
}
