//
//  MoodGradientView.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import RegisterMoodDomainInterface

public struct MoodGradientView: View {
    @Binding var currentMood: Mood
    @State var style: MoodViewStyle
    @State var hasShadow: Bool

    public init(currentMood: Binding<Mood>,
                style: MoodViewStyle = .loop,
                hasShadow: Bool = true) {
        self._currentMood = currentMood
        self.style = style
        self.hasShadow = hasShadow
    }

    public var body: some View {
        ZStack {
            backgroundRender
            MoodView(mood: currentMood)
        }
    }

    var backgroundRender: some View {
        RoundedRectangle(cornerRadius: RadiusTokens.large.constant)
            .fill(Color.white) // Base color of the rectangle
            .overlay(
                RadialGradient(
                    gradient: Gradient(colors: [getColor(for: currentMood), .clear]),
                    center: .center,
                    startRadius: 0,
                    endRadius: 180 // Adjust for gradient spread
                )
                .clipShape(RoundedRectangle(cornerRadius: RadiusTokens.large.constant))
            )
            .frame(width: 340, height: 340) // Set your preferred frame size
            .if(hasShadow) { view in
                view.shadow(radius: RadiusTokens.large.constant)
            }
    }

    private func getColor(for mood: Mood) -> Color {
        switch mood {
        case .veryUnpleasant: return .purple
        case .unpleasant: return .cyan
        case .neutral: return .yellow
        case .pleasant: return .green.opacity(0.8)
        case .veryPleasant: return .green
        }
    }

    public func moodColor() -> Color {
        return getColor(for: currentMood)
    }
}

#Preview {
    @Previewable @State var mood: Mood = .neutral
    MoodGradientView(currentMood: $mood)
    MoodGradientView(currentMood: $mood, hasShadow: false)
}
