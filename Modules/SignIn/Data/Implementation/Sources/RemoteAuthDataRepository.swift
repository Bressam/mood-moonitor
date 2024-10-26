//
//  LocalAuthDataRepository.swift
//  SignInData
//
//  Created by Giovanne Bressam on 15/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SignInDomainInterface

public class RemoteAuthDataRepository: AuthDataRepositoryProtocol {
    public init() {}

    public func getAuthData() async throws -> SignInDomainInterface.AuthData {
        try await Task.sleep(for: .seconds(2.5))
        return .init(authToken: "", refreshToken: "")
    }
}
