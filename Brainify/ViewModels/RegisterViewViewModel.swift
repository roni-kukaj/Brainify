//
//  RegisterViewViewModel.swift
//  Brainify
//
//  Created by Roni Kukaj on 29.1.24.
//

import Foundation


class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    init() {
        
    }
    func register() {
        
    }
    
    private func validate() {
        
    }
}
