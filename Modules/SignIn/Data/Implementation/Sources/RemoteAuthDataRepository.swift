//
//  LocalAuthDataRepository.swift
//  SignInData
//
//  Created by Giovanne Bressam on 15/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SignInDomainInterface

public class RemoteAuthDataRepository: AuthDataRepositoryProtocol {
    public func getAuthData() async throws -> SignInDomainInterface.AuthData {
        return .init(authToken: "", refreshToken: "")
    }
}
