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
        ZStack {
            gradientBackground
            VStack(spacing: SpacingTokens.xxlarge.constant) {
                todayEntrySectionView
                moodRegistryList
                Spacer()
            }.padding([.leading, .trailing],
                      SpacingTokens.xxlarge.constant)
            .onAppear(perform: {
                Task {
                    await viewModel.fetchMoodRegistry()
                }
            })
        }
        .foregroundStyle(DesignSystemAsset.secondaryColor.swiftUIColor)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Welcome :)")
                        .foregroundColor(DesignSystemAsset.primaryColor.swiftUIColor)
                        .font(.appLargeTitleFont)
                        .padding([.top], SpacingTokens.xxlarge.constant)
                        .padding([.leading], SpacingTokens.large.constant)
                    Spacer()
                }.padding([.top], SpacingTokens.xxlarge.constant)
            }
        }
    }

    private var gradientBackground: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                Gradient.Stop(color: DesignSystemAsset.backgroundLightPink.swiftUIColor.opacity(0.6),
                              location: 0.24),
                Gradient.Stop(color: DesignSystemAsset.backgroundLightBlue.swiftUIColor.opacity(0.6),
                              location: 0.76)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .opacity(0.55)
        .edgesIgnoringSafeArea(.all)
    }

    private var moodRegistryList: some View {
        VStack {
            HStack {
                Text("Registry")
                    .font(.appTitleFont)
                    .foregroundStyle(DesignSystemAsset.primaryColor.swiftUIColor)
                Spacer()
            }
            List(viewModel.moodRegistry, id: \.date) { moodRegistryEntry in
                HStack {
                    Text(moodRegistryEntry.moodEntry.moodLevel.name)
                    Spacer()
                    Text(dateFormatter.string(from: moodRegistryEntry.date!))
                }
                .foregroundStyle(DesignSystemAsset.secondaryColor.swiftUIColor)
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: RadiusTokens.regular.constant)
                    .fill(DesignSystemAsset.secondaryActionColor.swiftUIColor.opacity(0.2))
                    .shadow(radius: RadiusTokens.regular.constant)
            )
        }
    }

    private var todayEntrySectionView: some View {
        VStack(spacing: SpacingTokens.medium.constant) {
            HStack {
                Text("Today, \(dateFormatter.string(from: .init()))")
                    .font(.appTitleFont)
                    .foregroundStyle(DesignSystemAsset.primaryColor.swiftUIColor)
                Spacer()
                Button(action: {
                    viewModel.handleAddMoodEntry()
                }, label: {
                    Image(systemName: "plus")
                    Text("Log")
                })
                .foregroundStyle(DesignSystemAsset.primaryColor.swiftUIColor)
                .tint(DesignSystemAsset.primaryColor.swiftUIColor)
                .buttonStyle(.bordered)
            }
            todayEntryMoodView
        }
        .padding([.top], SpacingTokens.large.constant)
    }

    private var todayEntryMoodView: some View {
        ZStack(alignment: .center) {
            if let todayEntry = viewModel.todayMoodRegistry {
                MoodGradientView(currentMood: .constant(todayEntry.moodEntry.moodLevel),
                                 style: .playOnce,
                                 hasShadow: true,
                                 fillColor: DesignSystemAsset.secondaryActionColor.swiftUIColor.opacity(0.2))
                .foregroundStyle(DesignSystemAsset.secondaryColor.swiftUIColor)
            } else {
                RoundedRectangle(cornerRadius: RadiusTokens.regular.constant)
                    .fill(DesignSystemAsset.secondaryActionColor.swiftUIColor.opacity(0.2))
                    .frame(height: 340)
                    .shadow(radius: RadiusTokens.large.constant)
                Text("No mood entry for today. Log one when you feel it.")
                    .font(.appTitleFont)
                    .foregroundStyle(DesignSystemAsset.secondaryColor.swiftUIColor)
                    .padding([.leading, .trailing], SpacingTokens.large.constant)
            }
        }
    }
}

#if DEBUG
#Preview {
    NavigationStack {
        MoodRegistryView(moodRegistryViewModel: .preview)
    }
}
#endif
