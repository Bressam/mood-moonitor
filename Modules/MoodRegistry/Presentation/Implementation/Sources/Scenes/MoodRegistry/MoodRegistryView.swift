//
//  MoodRegistryView.swift
//  MoodRegistry
//
//  Created by Giovanne Bressam on 06/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct MoodRegistryView: View {
    // MARK: - Properties
    @ObservedObject private var viewModel: MoodRegistryViewModel
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter
    }()

    public init(moodRegistryViewModel: MoodRegistryViewModel) {
        self.viewModel = moodRegistryViewModel
    }

    // MARK: - Views
    public var body: some View {
        VStack(spacing: SpacingTokens.xxlarge.constant) {
            todayEntry
            moodRegistryList
            Spacer()
        }.padding([.leading, .trailing],
                  SpacingTokens.xxlarge.constant)
        .navigationTitle("Welcome :)")
    }

    let items = Array(1...10).map { "Item \($0)" }
    private var moodRegistryList: some View {
        VStack {
            HStack {
                Text("Registry")
                    .font(.appTitleFont)
                Spacer()
            }
            List(items, id: \.self) { item in
                Text(item)
            }
            .listStyle(PlainListStyle())
            .background(Color.clear)

        }
    }

    private var todayEntry: some View {
        VStack(spacing: SpacingTokens.medium.constant) {
            HStack {
                Text("Today, \(dateFormatter.string(from: .init()))")
                    .font(.appTitleFont)
                Spacer()
                Button(action: {
                    viewModel.handleAddMoodEntry()
                }, label: {
                    Image(systemName: "plus")
                    Text("Log")
                })
                .buttonStyle(.bordered)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.5))
                    .frame(height: 360)
                Text("Your mood here")
            }
        }
        .padding([.top], SpacingTokens.large.constant)
    }
}

#if DEBUG
#Preview {
    NavigationStack {
        MoodRegistryView(moodRegistryViewModel: .preview)
    }
}
#endif
