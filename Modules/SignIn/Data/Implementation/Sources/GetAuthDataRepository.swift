//
//  GetAuthDataRepository.swift
//  SignInData
//
//  Created by Giovanne Bressam on 15/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SignInDomainInterface

public class GetAuthDataRepository: GetAuthDataRepositoryProtocol {
    private let localAuthDataRepository: GetAuthDataRepositoryProtocol
    private let remoteAuthDataRepository: GetAuthDataRepositoryProtocol
    
    public init(localAuthDataRepository: GetAuthDataRepositoryProtocol,
                remoteAuthDataRepository: GetAuthDataRepositoryProtocol) {
        self.localAuthDataRepository = localAuthDataRepository
        self.remoteAuthDataRepository = remoteAuthDataRepository
    }

    public func getAuthData() async throws -> SignInDomainInterface.AuthResult {
        do {
            return try await localAuthDataRepository.getAuthData()
        } catch {
            return try await remoteAuthDataRepository.getAuthData()
        }
    }
}
