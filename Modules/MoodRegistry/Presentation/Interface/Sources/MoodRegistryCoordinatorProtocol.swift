//
//  MoodRegistryCoordinator.swift
//  MoodRegistryFeature
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//
import CoordinatorInterface

public protocol MoodRegistryCoordinatorProtocol: CoordinatorProtocol {
    func navigateToRegisterMood()
    func navigateToRegisterFeelings()
    func navigateToMoodRegistry()
}
