//
//  Mood.swift
//  RegisterMoodDomain
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

public enum Mood: Codable, CaseIterable {
    case veryUnpleasant, unpleasant, neutral, pleasant, veryPleasant

    public var name: String {
        switch self {
        case .veryUnpleasant: return "Very Unpleasant"
        case .unpleasant: return "Unpleasant"
        case .neutral: return "Neutral"
        case .pleasant: return "Pleasant"
        case .veryPleasant: return "Very Pleasant"
        }
    }
}
