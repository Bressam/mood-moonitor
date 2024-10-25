//
//  AppDelegate.swift
//  MoodMoonitor
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit
import CoordinatorInterface

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    var window: UIWindow?
    var mainCoordinator: CoordinatorProtocol!

    // MARK: - Lifecycle
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setup()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainCoordinator.navigationController
        window?.makeKeyAndVisible()
        mainCoordinator.start()

        return true
    }

    // MARK: - Setup
    private func setup() {
        setupCoordinators()
    }

    // MARK: - Dependencies setup
    private func setupCoordinators() {
        mainCoordinator = MainCoordinator()
    }
}
