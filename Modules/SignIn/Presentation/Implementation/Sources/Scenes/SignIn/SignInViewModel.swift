//
//  SignInViewModel.swift
//  SignInFeature
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import Foundation
import SignInFeatureInterface
import SignInDomainInterface

public class SignInViewModel: ObservableObject {
    private weak var coordinator: SignInCoordinatorProtocol?
    private var loginUseCase: LoginUseCaseProtocol
    
    @MainActor
    @Published var isloading: Bool = false

    public init(coordinator: SignInCoordinatorProtocol, loginUseCase: LoginUseCaseProtocol) {
        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
    }

    func signIn(with credentials: LoginCredentials) async {
        setLoading(to: true)
        do {
            let authData = try await loginUseCase.execute(with: credentials)
            setLoading(to: false)
            coordinator?.navigateToSignedInArea()
        } catch {
            setLoading(to: false)
            print("Failed to login: \(error.localizedDescription)")
        }
    }
    
    func setLoading(to isLoading: Bool) {
        Task {
            await MainActor.run {
                isloading = isLoading
            }
        }
    }
}
