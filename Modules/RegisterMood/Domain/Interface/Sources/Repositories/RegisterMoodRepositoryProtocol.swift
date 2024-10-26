//
//  RegisterMoodRepositoryProtocol.swift
//  RegisterMoodDomain
//
//  Created by Giovanne Bressam on 13/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

public protocol RegisterMoodRepositoryProtocol: AnyObject {
    func saveMood(_ mood: MoodEntry) async throws
}
