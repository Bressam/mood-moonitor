//
//  RegisterMoodCoordinatorProtocol.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//
import CoordinatorInterface
import RegisterMoodDomainInterface
import MoodRegistryDomainInterface

public protocol RegisterMoodCoordinatorDelegate: AnyObject {
    func didRegisterMood()
}

public protocol RegisterMoodCoordinatorProtocol: CoordinatorProtocol {
    var delegate: RegisterMoodCoordinatorDelegate? { get set }

    func navigateToMood()
    func navigateToFeelings(carrying: MoodEntry)
    func navigateToAddDetails(carrying: MoodEntry)
    func finishFlow()
}
