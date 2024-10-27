//
//  ViewModifier+Conditional.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
