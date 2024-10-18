//
//  LoginCredentials.swift
//  SignInDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

public struct LoginCredentials: Encodable {
    let username: String
    let password: String

    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
