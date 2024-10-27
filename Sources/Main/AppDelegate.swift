//
//  AppDelegate.swift
//  MoodMoonitor
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit
import CoordinatorInterface
import MoodRegistryDomainInterface

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

        bootstrap()
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

    // Debug only. Prepares app for demo presentation with past data
    private func bootstrap() {
        let moodEntryKey = "MoodEntryKey"
        let oneDayTimeInterval: Double = 60 * 60 * 24

        var moodRegistryEntries: [MoodRegistryEntry] = [
            .init(date: Date().addingTimeInterval(-(1 * oneDayTimeInterval)),
                  moodEntry: .init(moodLevel: .neutral, feelings: [], moodDescription: "")),
            .init(date: Date().addingTimeInterval(-(2 * oneDayTimeInterval)),
                  moodEntry: .init(moodLevel: .pleasant, feelings: [], moodDescription: "")),
            .init(date: Date().addingTimeInterval(-(3 * oneDayTimeInterval)),
                  moodEntry: .init(moodLevel: .unpleasant, feelings: [], moodDescription: "")),
            .init(date: Date().addingTimeInterval(-(4 * oneDayTimeInterval)),
                  moodEntry: .init(moodLevel: .veryPleasant, feelings: [], moodDescription: "")),
            .init(date: Date().addingTimeInterval(-(5 * oneDayTimeInterval)),
                  moodEntry: .init(moodLevel: .veryUnpleasant, feelings: [], moodDescription: "")),
            .init(date: Date().addingTimeInterval(-(6 * oneDayTimeInterval)),
                  moodEntry: .init(moodLevel: .unpleasant, feelings: [], moodDescription: "")),
            .init(date: Date().addingTimeInterval(-(7 * oneDayTimeInterval)),
                  moodEntry: .init(moodLevel: .pleasant, feelings: [], moodDescription: ""))
        ]

        // Reseet registry
        UserDefaults.standard.set(nil, forKey: moodEntryKey)
        
        // Stores 7 days registry
        if let encodedData = try? JSONEncoder().encode(moodRegistryEntries) {
            UserDefaults.standard.set(encodedData, forKey: moodEntryKey)
        }
        return
    }
}
