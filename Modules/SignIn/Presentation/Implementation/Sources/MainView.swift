//
//  MainView.swift
//  SignIn
//
//  Created by Giovanne Bressam on 06/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI

public struct SignInView: View {
    public init() { }

    public var body: some View {
        VStack(alignment: .center) {
            TextField("Username", text: .constant(""))
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .font(.callout)
                .foregroundStyle(.gray)
            TextField("Password", text: .constant(""))
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .keyboardType(.default)
                .font(.callout)
                .foregroundStyle(.red)

            Button {
                print("Login tapped")
            } label: {
                Text("Login")
            }
        }.padding([.leading, .trailing], 26)
    }
}

#Preview {
    SignInView()
}
