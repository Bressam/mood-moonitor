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
    @ObservedObject private var viewModel: SignInViewModel
    @State private var email: String = ""
    @State private var password: String = ""

    public init(signInViewModel: SignInViewModel) {
        self.viewModel = signInViewModel
    }

    public var body: some View {
        ZStack {
            gradientBackground
            if viewModel.isloading {
                LoadingIndicatorView()
            } else {
                VStack(alignment: .center,
                       spacing: SpacingTokens.xxlarge.constant) {
                    appLogo
                    inputFields
                    signInButton
                }.padding([.leading, .trailing],
                          SpacingTokens.large.constant)
            }
        }
    }

    private var gradientBackground: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                Gradient.Stop(color: DesignSystemAsset.backgroundLightPink.swiftUIColor,
                              location: 0.24),
                Gradient.Stop(color: DesignSystemAsset.backgroundLightBlue.swiftUIColor,
                              location: 0.76)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .opacity(0.55)
        .edgesIgnoringSafeArea(.all)
    }

    private var appLogo: some View {
        VStack(alignment: .center,
               spacing: SpacingTokens.small.constant) {
            DesignSystemAsset.appLogo.swiftUIImage
                .resizable()
                .frame(width: 120, height: 120)
            Text("Mood Moonitor")
                .font(.appLargeTitleFont)
                .foregroundStyle(DesignSystemAsset.primaryColor.swiftUIColor)
        }
    }

    private var inputFields: some View {
        VStack(alignment: .center,
               spacing: SpacingTokens.medium.constant) {
            MMTextField(fieldTitle: "e-mail",
                        inputText: $email)
            MMTextField(fieldTitle: "password",
                        inputText: $password,
                        isSecured: true,
                        style: .password,
                        forgotPasswordTitle: "Forgot password? ",
                        forgetPasswordAction: didTapForgetPassword)
        }
    }

    private var signInButton: some View {
        MMButton(title: "Login") {
            Task {
                await viewModel.signIn(with: .init(username: email,
                                                   password: password))
            }
        }
    }

    private func didTapForgetPassword() {
        print("Restore password tapped")
    }
}

#if DEBUG
#Preview {
    SignInView(signInViewModel: .preview)
}
#endif
