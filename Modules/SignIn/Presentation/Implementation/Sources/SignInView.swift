//
//  SignInView.swift
//  SignIn
//
//  Created by Giovanne Bressam on 06/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct SignInView: View {
    public init() { }

    public var body: some View {
        VStack(alignment: .center,
               spacing: SpacingTokens.medium.constant) {
            MMTextField(fieldTitle: "e-mail",
                        inputText: "")
            MMTextField(fieldTitle: "password",
                        inputText: "",
                        isSecured: true,
                        style: .password,
                        forgotPasswordTitle: "Forgot password? ",
                        forgetPasswordAction: didTapForgetPassword)

            Button {
                print("Login tapped")
            } label: {
                Text("Login")
            }
        }.padding([.leading, .trailing],
                  SpacingTokens.large.constant)
    }

    private func didTapForgetPassword() {
        print("Restore password tapped")
    }
}

#Preview {
    SignInView()
}
