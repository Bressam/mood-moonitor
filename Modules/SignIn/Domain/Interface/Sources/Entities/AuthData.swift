//
//  AuthData.swift
//  SignInDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

public struct AuthData {
    public let authToken: String
    public let refreshToken: String

    public init (authToken: String, refreshToken: String) {
        self.authToken = authToken
        self.refreshToken = refreshToken
    }
}
