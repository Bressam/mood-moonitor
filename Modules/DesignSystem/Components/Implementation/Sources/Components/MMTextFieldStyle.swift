//
//  MMTextField.swift
//  DesignSystem
//
//  Created by Giovanne Bressam on 17/10/24.
//  Copyright © 2024 dev.bressam. All rights reserved.
//

import SwiftUI

public enum MMTextFieldStyle {
    case regular, password

    var hasSecurityToggle: Bool {
        switch self {
        case .regular: false
        case .password: true
        }
    }

    var hasStorePasswordSwitch: Bool {
        switch self {
        case .regular: false
        case .password: true
        }
    }

    var buttonTitle: String {
        switch self {
        case .regular: ""
        case .password: "Forgot password?"
        }
    }
}

public struct MMTextField: View {
    @State var fieldTitle: String
    @State var inputText: String
    @State var isSecured: Bool
    @State var style: MMTextFieldStyle
    let forgotPasswordTitle: String?
    var forgetPasswordAction: (() -> Void)?
    @State private var storePassword: Bool

    public init(fieldTitle: String,
                inputText: String,
                isSecured: Bool = false,
                style: MMTextFieldStyle = .regular,
                forgotPasswordTitle: String? = nil,
                forgetPasswordAction: (() -> Void)? = nil,
                storePassword: Bool = true) {
        self.fieldTitle = fieldTitle
        self.inputText = inputText
        self.isSecured = isSecured
        self.style = style
        self.forgotPasswordTitle = forgotPasswordTitle
        self.forgetPasswordAction = forgetPasswordAction
        self.storePassword = storePassword
    }

    public var body: some View {
        VStack(alignment: .leading,
               spacing: SpacingTokens.xsmall.constant) {
            HStack {
                Text(fieldTitle)
                    .font(.callout)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
                if let forgetPasswordAction {
                    Spacer()
                    Button(action: forgetPasswordAction,
                           label: {
                        Text(forgotPasswordTitle ?? style.buttonTitle)
                            .font(.footnote)
                            .foregroundStyle(DesignSystemAsset.primaryColor.swiftUIColor)
                    })
                }
            }

            HStack {
                inputField
                    .padding(.leading, SpacingTokens.small.constant)
                    .frame(height: 48)
                Spacer()
                if style.hasSecurityToggle {
                    Button(action: {
                        isSecured.toggle()
                    }, label: {
                        if isSecured {
                            Image(systemName: "eye")
                                .foregroundStyle(.gray.opacity(0.8))
                        } else {
                            Image(systemName: "eye.slash")
                                .foregroundStyle(.gray.opacity(0.8))
                        }
                    }).padding(.trailing, SpacingTokens.small.constant)
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: RadiusTokens.small.constant)
                    .stroke(lineWidth: 0.5)
            }

            if style.hasStorePasswordSwitch {
                staySignedInSwitch
                    .padding(.top, SpacingTokens.xsmall.constant)
            }
        }
    }

    @ViewBuilder
    private var inputField: some View {
        if isSecured {
            SecureField("", text: $inputText)
                .foregroundStyle(.gray)
                .font(.caption2)
                .fontWeight(.ultraLight)
        } else {
            TextField("", text: $inputText)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .font(.callout)
                .foregroundStyle(.gray)
        }
    }

    private var staySignedInSwitch: some View {
        Toggle(isOn: $storePassword, label: {
            HStack {
                Spacer()
                Text("Stay signed in")
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
            }
        })
        .scaleEffect(0.7)
        .offset(x: 50)
    }
}

#Preview("MMTextField - Not secured",
         traits: .sizeThatFitsLayout) {
    MMTextField(fieldTitle: "Field title",
                inputText: "")
        .padding(24)
}

#Preview("MMTextField - Secured",
         traits: .sizeThatFitsLayout) {
    MMTextField(fieldTitle: "Field title",
                inputText: "",
                isSecured: true,
                style: .password,
                forgotPasswordTitle: "Forgot password? ",
                forgetPasswordAction: {
                    print("Forgot password")
                })
    .padding(24)
}
