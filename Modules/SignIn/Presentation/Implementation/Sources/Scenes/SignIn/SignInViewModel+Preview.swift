//
//  SignInViewModel+Preview.swift
//  SignInFeature
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

#if DEBUG
import SignInTesting

extension SignInViewModel {
    @MainActor
    static var preview: SignInViewModel {
        return .init(coordinator: SignInCoordinatorStub(),
                     loginUseCase: LoginUseCaseStub())
    }
}
#endif
