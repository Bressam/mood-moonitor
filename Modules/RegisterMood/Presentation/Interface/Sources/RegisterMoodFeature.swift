//
//  RegisterMoodFeature.swift
//  RegisterMood
//
//  Created by Giovanne Bressam on 06/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit
import CoordinatorInterface

public struct RegisterMoodFeature {
    var coordinator: RegisterMoodCoordinatorProtocol

    public init(coordinator: RegisterMoodCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    @MainActor
    public func start() -> UIViewController {
        coordinator.start()
        return coordinator.navigationController
    }
}
