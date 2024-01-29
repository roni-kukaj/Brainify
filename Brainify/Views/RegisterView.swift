//
//  RegisterView.swift
//  Brainify
//
//  Created by Roni Kukaj on 29.1.24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start memorizing today!",
                       angle: 15,
                       background: .orange)
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                CustomButton(title: "Create Account", background: .green){
                    // attempt register
                }
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
