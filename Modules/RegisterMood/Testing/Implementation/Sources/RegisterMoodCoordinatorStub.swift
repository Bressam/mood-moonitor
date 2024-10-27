//
//  RegisterMoodCoordinatorStub.swift
//  RegisterMoodTesting
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodFeatureInterface
import RegisterMoodDomainInterface
import CoordinatorInterface
import MoodRegistryDomainInterface

public final class RegisterMoodCoordinatorStub: RegisterMoodCoordinatorProtocol {
    public var navigationController: MMNavigationController = .init()

    public init() {}

    public func start() {
        print("RegisterMoodCoordinatorStub: start")
    }

    public func navigateToMood() {
        print("RegisterMoodCoordinatorStub: navigateToMood")
    }

    public func navigateToFeelings(carrying: MoodEntry) {
        print("RegisterMoodCoordinatorStub: navigateToFeelings")
    }

    public func navigateToAddDetails(carrying: MoodEntry) {
        print("RegisterMoodCoordinatorStub: navigateToAddDetails")
    }
}
