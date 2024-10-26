//
//  FeelingsSelectionView.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct FeelingsSelectionView: View {
    // MARK: - Properties
    @ObservedObject
    private var viewModel: FeelingsSelectionViewModel

    // MARK: Init
    public init(viewModel: FeelingsSelectionViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Views
    var body: some View {
        VStack {
            feelingsListView
            MMButton(title: "Continue") {
                viewModel.handleFinishSelectedFeelings()
            }
        }
        .onAppear(perform: {
            Task {
                await viewModel.fetchAvailableFeelings()
            }
        })
    }

    private var feelingsListView: some View {
        ScrollView {
            LazyVGrid(columns: [.init(.adaptive(minimum: 80, maximum: .infinity))],
                      spacing: 20) {
                ForEach(viewModel.feelings, id: \.self) { feeling in
                    Text(feeling.name)
                        .padding()
                        .frame(minWidth: 80)
                        .background(viewModel.selectedFeelings.contains(feeling) ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .lineLimit(1) // Prevents multi-line text
                        .fixedSize(horizontal: true, vertical: false) // Prevents text compression
                        .onTapGesture {
                            viewModel.toggleSelection(for: feeling)
                        }
                }
            }
            .padding()
        }
    }
}

struct ContentView: View {
    var body: some View {
        FeelingsSelectionView(viewModel: .preview)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
