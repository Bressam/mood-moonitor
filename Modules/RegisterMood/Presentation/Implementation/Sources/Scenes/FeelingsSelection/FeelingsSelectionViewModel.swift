//
//  FeelingsSelectionViewModel.swift
//  RegisterMoodFeature
//
//  Created by Giovanne Bressam on 26/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import Foundation
import RegisterMoodFeatureInterface
import RegisterMoodDomainInterface

public class FeelingsSelectionViewModel: ObservableObject {
    // MARK: - Properties
    private weak var coordinator: RegisterMoodCoordinatorProtocol?
    private let retrieveFeelingsUseCase: RetrieveAvailableFeelingsUseCaseProtocol
    @Published var feelings: [Feeling] = []
    @Published var selectedFeelings: Set<Feeling> = []

    // MARK: - Init
    public init(coordinator: RegisterMoodCoordinatorProtocol?,
                retrieveFeelingsUseCase: RetrieveAvailableFeelingsUseCaseProtocol) {
        self.coordinator = coordinator
        self.retrieveFeelingsUseCase = retrieveFeelingsUseCase
    }

    // MARK: - Data Related
    func fetchAvailableFeelings() async {
        feelings = (try? await retrieveFeelingsUseCase.execute()) ?? []
    }

    func toggleSelection(for item: Feeling) {
        if selectedFeelings.contains(item) {
            selectedFeelings.remove(item)
        } else {
            selectedFeelings.insert(item)
        }
    }

    // MARK: - Navigation
    public func handleFinishSelectedFeelings() {
        coordinator?.navigateToAddDetails()
    }
}