//
//  CoordinatorProtocol.swift
//  SignIn
//
//  Created by Giovanne Bressam on 06/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit

public protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get }
    func start()
}
