//
//  RegisterMoodCoordinatorStub.swift
//  RegisterMoodTesting
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import RegisterMoodFeatureInterface
import CoordinatorInterface

public final class RegisterMoodCoordinatorStub: RegisterMoodCoordinatorProtocol {
    public var navigationController: MMNavigationController = .init()

    public init() {}

    public func start() {
        print("RegisterMoodCoordinatorStub: start")
    }

    public func navigateToMood() {
        print("RegisterMoodCoordinatorStub: navigateToMood")
    }

    public func navigateToFeelings() {
        print("RegisterMoodCoordinatorStub: navigateToFeelings")
    }

    public func navigateToAddDetails() {
        print("RegisterMoodCoordinatorStub: navigateToAddDetails")
    }
}
