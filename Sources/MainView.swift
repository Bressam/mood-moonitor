//
//  MainView.swift
//  MoodMoonitor
//
//  Created by Giovanne Bressam on 06/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Image(.launchscreenLogo)
            Text("Hello, World!")
                .foregroundStyle(.launchscreenBackground)
        }
    }
}

#Preview {
    MainView()
}
