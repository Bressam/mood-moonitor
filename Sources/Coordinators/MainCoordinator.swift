//
//  MainCoordinator.swift
//  MoodMoonitor
//
//  Created by Giovanne Bressam on 20/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit
import SwiftUI
import CoordinatorInterface

class MainCoordinator: CoordinatorProtocol {
    let navigationController: UINavigationController = .init()
    
    func start() {
        let vc = UIHostingController(rootView: MainView())
        navigationController.pushViewController(vc, animated: false)
    }
}
