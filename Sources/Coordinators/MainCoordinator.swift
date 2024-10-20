//
//  MainCoordinator.swift
//  MoodMoonitor
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit
import SwiftUI
import CoordinatorInterface
import SignInFeatureInterface
import SignInFeature

class MainCoordinator: CoordinatorProtocol {
    let navigationController: UINavigationController = .init()
    let signInCoordinator: SignInCoordinatorProtocol
    
    init() {
        self.signInCoordinator = SignInMainCoordinator(navigationController: navigationController)
    }
    
    func start() {
        signInCoordinator.start()
    }
}
