//
//  Feeling.swift
//  RegisterMoodDomain
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

public struct Feeling: Codable, Hashable {
    public let name: String

    public init(name: String) {
        self.name = name
    }
}
