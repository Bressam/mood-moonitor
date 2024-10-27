//
//  MoodGradientView.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import MoodRegistryDomainInterface

public struct MoodGradientView: View {
    @Binding var currentMood: Mood
    @State var style: MoodViewStyle
    @State var hasShadow: Bool
    @State var hasMoodName: Bool
    @State var fillColor: Color
    @State var textColor: Color

    public init(currentMood: Binding<Mood>,
                style: MoodViewStyle = .loop,
                hasShadow: Bool = true,
                hasMoodName: Bool = true,
                fillColor: Color = .clear,
                textColor: Color = DesignSystemAsset.secondaryColor.swiftUIColor) {
        self._currentMood = currentMood
        self.style = style
        self.hasShadow = hasShadow
        self.hasMoodName = hasMoodName
        self.fillColor = fillColor
        self.textColor = textColor
    }

    public var body: some View {
        ZStack {
            backgroundRender
            MoodView(mood: $currentMood, style: style, hasTitle: hasMoodName)
        }
        .foregroundStyle(textColor)
    }

    var backgroundRender: some View {
        RoundedRectangle(cornerRadius: RadiusTokens.large.constant)
            .fill(fillColor)
            .frame(width: 340, height: 340)
            .if(hasShadow) { view in
                view.shadow(radius: RadiusTokens.large.constant)
            }
            .overlay(
                RadialGradient(
                    gradient: Gradient(colors: [getColor(for: currentMood), .clear]),
                    center: .center,
                    startRadius: 0,
                    endRadius: 180
                )
                .clipShape(RoundedRectangle(cornerRadius: RadiusTokens.large.constant))
            )
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
