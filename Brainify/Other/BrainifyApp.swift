//
//  BrainifyApp.swift
//  Brainify
//
//  Created by Roni Kukaj on 29.1.24.
//

import FirebaseCore
import SwiftUI

@main
struct BrainifyApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
