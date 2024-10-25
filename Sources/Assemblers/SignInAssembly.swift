//
//  SignInAssembly.swift
//  MoodMoonitorApp
//
//  Created by Giovanne Bressam on 23/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SignInFeatureInterface
import SignInFeature
import SignInDomain
import SignInData

class SignInCoordinatorAssembly {
    @MainActor
    static func assemble(signedInCoordinatorHandler: SignedInCoordinatorHandlerProtocol) -> SignInCoordinatorProtocol {
        let repository = AuthDataRepository(localAuthDataRepository: LocalAuthDataRepository(),
                                            remoteAuthDataRepository: RemoteAuthDataRepository())

        return SignInMainCoordinator(signedInCoordinatorHandler: signedInCoordinatorHandler,
                                     loginUseCase: LoginUseCase(repository: repository))
    }
}
