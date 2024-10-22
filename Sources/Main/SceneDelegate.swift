//
//  SceneDelegate.swift
//  MoodMoonitor
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import Foundation
import UIKit
import CoordinatorInterface

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Properties
    var window: UIWindow?
    var mainCoordinator: CoordinatorProtocol!
    
    // MARK: - Scene setup
    private func setup() {
        setupCoordinators()
    }

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        let windowScene = UIWindowScene(session: session,
                                        connectionOptions: connectionOptions)
        self.window = UIWindow(windowScene: windowScene)

        setup()
        self.window?.rootViewController = mainCoordinator.navigationController
        self.window?.makeKeyAndVisible()
        mainCoordinator.start()
    }
    
    // MARK: - Dependencies setup
    private func setupCoordinators() {
        mainCoordinator = MainCoordinator()
    }
}
