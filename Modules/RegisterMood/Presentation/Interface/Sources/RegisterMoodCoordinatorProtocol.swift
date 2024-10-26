//
//  RegisterMoodCoordinatorProtocol.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//
import CoordinatorInterface

public protocol RegisterMoodCoordinatorProtocol: CoordinatorProtocol {
    func navigateToMood()
    func navigateToFeelings()
    func navigateToAddDetails()
}
