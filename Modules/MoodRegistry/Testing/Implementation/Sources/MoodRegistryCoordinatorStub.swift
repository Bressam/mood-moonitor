//
//  MoodRegistryCoordinatorStub.swift
//  MoodRegistryTesting
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import MoodRegistryFeatureInterface
import CoordinatorInterface

public final class MoodRegistryCoordinatorStub: MoodRegistryCoordinatorProtocol {
    public var navigationController: MMNavigationController = .init()

    public init() {}

    public func start() {
        print("MoodRegistryCoordinatorStub: start")
    }

    public func navigateToMoodRegistry() {
        print("MoodRegistryCoordinatorStub: navigateToMoodRegistry")
    }

    public func navigateToRegisterMood() {
        print("MoodRegistryCoordinatorStub: navigateToRegisterMood")
    }

    public func navigateToRegisterFeelings() {
        print("MoodRegistryCoordinatorStub: navigateToRegisterFeelings")
    }
}
