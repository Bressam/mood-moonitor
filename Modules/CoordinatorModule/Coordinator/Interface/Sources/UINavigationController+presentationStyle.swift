//
//  UINavigationController+presentationStyle.swift
//  Coordinator
//
//  Created by Giovanne Bressam on 21/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import UIKit

public class MMNavigationController: UINavigationController {
    public override var modalPresentationStyle: UIModalPresentationStyle {
        get {
            return super.modalPresentationStyle == .automatic ? .fullScreen : super.modalPresentationStyle
        } set {
            super.modalPresentationStyle = newValue
        }
    }
}
