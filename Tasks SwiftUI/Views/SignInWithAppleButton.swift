//
//  SignInWithAppleButton.swift
//  Tasks SwiftUI
//
//  Created by Sterling Mortensen on 5/18/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//
import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
}
