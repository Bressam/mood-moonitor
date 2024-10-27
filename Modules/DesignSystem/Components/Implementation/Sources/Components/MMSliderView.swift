//
//  MMSliderView.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

/**
 development based on https://swdevnotes.com/swift/2021/how-to-customise-the-slider-in-swiftui/
 */

import SwiftUI

public struct MMSliderView: View {
    @Binding var value: Double
    @State var lastCoordinateValue: CGFloat = 0.0
    var sliderRange: ClosedRange<Double> = 1...100
    var thumbColor: Color = .yellow
    var minTrackColor: Color = .blue
    var maxTrackColor: Color = .gray

    public init(value: Binding<Double>,
                lastCoordinateValue: CGFloat = 0.0,
                sliderRange: ClosedRange<Double>,
                thumbColor: Color, minTrackColor: Color, maxTrackColor: Color) {
        self._value = value
        self.lastCoordinateValue = lastCoordinateValue
        self.sliderRange = sliderRange
        self.thumbColor = thumbColor
        self.minTrackColor = minTrackColor
        self.maxTrackColor = maxTrackColor
    }

    public var body: some View {
        GeometryReader { gemetry in
            let thumbHeight = gemetry.size.height * 1
            let thumbWidth = gemetry.size.width * 0.078
            let radius = gemetry.size.height * 0.5
            let minValue = gemetry.size.width * 0.015
            let maxValue = (gemetry.size.width * 0.98) - thumbWidth * 0.3

            let scaleFactor = (maxValue - minValue) / (sliderRange.upperBound - sliderRange.lowerBound)
            let lower = sliderRange.lowerBound
            let sliderVal = (self.value - lower) * scaleFactor + minValue

            ZStack {
                Rectangle()
                    .foregroundColor(maxTrackColor)
                    .frame(width: gemetry.size.width, height: gemetry.size.height * 0.95)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
                HStack {
                    Rectangle()
                        .foregroundColor(minTrackColor)
                        .frame(width: sliderVal, height: gemetry.size.height * 0.95)
                    Spacer()
                }
                .clipShape(RoundedRectangle(cornerRadius: radius))
                HStack {
                    Circle()
                        .foregroundColor(thumbColor)
                        .frame(width: thumbWidth, height: thumbHeight)
                        .offset(x: sliderVal - 14)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    if abs(value.translation.width) < 0.1 {
                                        self.lastCoordinateValue = sliderVal
                                    }
                                    if value.translation.width > 0 {
                                        let nextCoordinateValue = min(maxValue,
                                                                      lastCoordinateValue + value.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor)  + lower
                                    } else {
                                        let nextCoordinateValue = max(minValue,
                                                                      lastCoordinateValue + value.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                    }
                                }
                        )
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    var sliderValue: Binding<Double> = .constant(1.0)
    MMSliderView(value: sliderValue,
                 sliderRange: 0...4,
                 thumbColor: DesignSystemAsset.primaryColor.swiftUIColor.opacity(1),
                 minTrackColor: DesignSystemAsset.secondaryColor.swiftUIColor.opacity(1),
                 maxTrackColor: DesignSystemAsset.secondaryColor.swiftUIColor.opacity(0.3))
    .frame(height: 30)
    .padding()
}
