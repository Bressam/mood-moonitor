//
//  FeelingsSelectionView.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI

struct FeelingsSelectionView: View {
    let items: [String]
    var onContinue: ([String]) -> Void
    @State private var selectedItems: Set<String> = []

    private let columns = [
        GridItem(.adaptive(minimum: 80, maximum: .infinity))
    ]

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .padding()
                            .frame(minWidth: 80)
                            .background(selectedItems.contains(item) ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .lineLimit(1) // Prevents multi-line text
                            .fixedSize(horizontal: true, vertical: false) // Prevents text compression
                            .onTapGesture {
                                toggleSelection(for: item)
                            }
                    }
                }
                .padding()
            }

            Button(action: {
                onContinue(Array(selectedItems))
            }, label: {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.horizontal)
            })
        }
    }

    private func toggleSelection(for item: String) {
        if selectedItems.contains(item) {
            selectedItems.remove(item)
        } else {
            selectedItems.insert(item)
        }
    }
}

struct ContentView: View {
    var body: some View {
        FeelingsSelectionView(items: ["Apple", "Banana", "Cherry", "Date", "Elderberry"]) { selectedItems in
            print("Selected items: \(selectedItems)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
