//
//  FlowLayout.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

/**
 Based on flowLayout implementation: https://github.com/globulus/swiftui-flow-layout
 */

import SwiftUI

public let flowLayoutDefaultItemSpacing: CGFloat = 4

public struct FlowLayout<RefreshBinding, Data: Collection, ItemView: View>: View {
    let mode: Mode
    @Binding var binding: RefreshBinding
    let items: Data
    let itemSpacing: CGFloat
    @ViewBuilder let viewMapping: (Data.Element) -> ItemView
    @State private var totalHeight: CGFloat

    public init(mode: Mode,
                binding: Binding<RefreshBinding>,
                items: Data,
                itemSpacing: CGFloat = flowLayoutDefaultItemSpacing,
                @ViewBuilder viewMapping: @escaping (Data.Element) -> ItemView) {
        self.mode = mode
        _binding = binding
        self.items = items
        self.itemSpacing = itemSpacing
        self.viewMapping = viewMapping
        _totalHeight = State(initialValue: (mode == .scrollable) ? .zero : .infinity)
    }

    public var body: some View {
        let stack = VStack {
            GeometryReader { geometry in
                self.content(in: geometry)
            }
        }
        return Group {
            if mode == .scrollable {
                stack.frame(height: totalHeight)
            } else {
                stack.frame(maxHeight: totalHeight)
            }
        }
    }

    private func content(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var lastHeight = CGFloat.zero
        let itemCount = items.count
        return ZStack(alignment: .topLeading) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                viewMapping(item)
                    .padding([.horizontal, .vertical], itemSpacing)
                    .alignmentGuide(.leading, computeValue: { dimensions in
                        if abs(width - dimensions.width) > geometry.size.width {
                            width = 0
                            height -= lastHeight
                        }
                        lastHeight = dimensions.height
                        let result = width
                        if index == itemCount - 1 {
                            width = 0
                        } else {
                            width -= dimensions.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if index == itemCount - 1 {
                            height = 0
                        }
                        return result
                    })
            }
        }
        .background(HeightReaderView(binding: $totalHeight))
    }

    public enum Mode {
        case scrollable, vstack
    }
}

private struct HeightPreferenceKey: PreferenceKey {
    static func reduce(value _: inout CGFloat, nextValue _: () -> CGFloat) {}
    static var defaultValue: CGFloat = 0
}

private struct HeightReaderView: View {
    @Binding var binding: CGFloat
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(key: HeightPreferenceKey.self, value: geo.frame(in: .local).size.height)
        }
        .onPreferenceChange(HeightPreferenceKey.self) { height in
            binding = height
        }
    }
}

public extension FlowLayout where RefreshBinding == Never? {
    init(mode: Mode,
         items: Data,
         itemSpacing: CGFloat = flowLayoutDefaultItemSpacing,
         @ViewBuilder viewMapping: @escaping (Data.Element) -> ItemView) {
        self.init(mode: mode,
                  binding: .constant(nil),
                  items: items,
                  itemSpacing: itemSpacing,
                  viewMapping: viewMapping)
    }
}

// MARK: - Previews
struct FlowLayout_Previews: PreviewProvider {
    static var previews: some View {
        FlowLayout(mode: .scrollable,
                   items: ["Some long item here", "And then some longer one",
                           "Short", "Items", "Here", "And", "A", "Few", "More",
                           // swiftlint:disable:next line_length
                           "And then a very very very long long long long long long long long longlong long long long long long longlong long long long long long longlong long long long long long longlong long long long long long longlong long long long long long long long one", "and", "then", "some", "short short short ones"]) {
            Text($0)
                .font(.system(size: 12))
                .foregroundColor(.black)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4)
                    .border(Color.gray)
                    .foregroundColor(Color.gray))
        }.padding()
    }
}

struct TestWithRange_Previews: PreviewProvider {
    static var previews: some View {
        FlowLayout(mode: .scrollable,
                   items: 1..<100) {
            Text("\($0)")
                .font(.system(size: 12))
                .foregroundColor(.black)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4)
                    .border(Color.gray)
                    .foregroundColor(Color.gray))
        }.padding()
    }
}
