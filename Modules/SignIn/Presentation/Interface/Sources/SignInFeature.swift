//
//  SignInFeature.swift
//  SignIn
//
//  Created by Giovanne Bressam on 06/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit
import CoordinatorInterface

public struct SignInFeature {
    var coordinator: SignInCoordinatorProtocol

    public init(coordinator: SignInCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    @MainActor
    public func start() -> UIViewController {
        coordinator.start()
        return coordinator.navigationController
    }
}
