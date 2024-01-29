
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
