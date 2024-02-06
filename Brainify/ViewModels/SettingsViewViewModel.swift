

import Foundation
import SwiftUI

class SettingsViewViewModel: ObservableObject {
    @Published var selectedSortMode: String?
    @Published var sortOptions = ["AZ", "ZA", "Random"]
    @Published var showAlert = false
    
    init() {
        
    }
    
    func updateSettings() {
        if (selectedSortMode != nil) {
            SettingsData.sort = selectedSortMode ?? "AZ"
        }
        return
    }
}
