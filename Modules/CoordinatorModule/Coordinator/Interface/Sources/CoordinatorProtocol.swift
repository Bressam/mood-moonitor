//
//  CoordinatorProtocol.swift
//  SignIn
//
//  Created by Giovanne Bressam on 06/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit

@MainActor
public protocol CoordinatorProtocol: AnyObject {
    var navigationController: MMNavigationController { get }
    func start()
    func dismiss()
}

public extension CoordinatorProtocol {
    func dismiss() {
        navigationController.dismiss(animated: true, completion: { [weak self] in
            self?.navigationController.viewControllers.removeAll()
        })
    }
}
