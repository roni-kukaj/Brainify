

import Foundation

class SettingsViewViewModel: ObservableObject {
    @Published var selectedColorMode: String?
    @Published var selectedSortMode: String?
    @Published var colorOptions = ["light", "dark"]
    @Published var sortOptions = ["AZ", "ZA", "Random"]
    @Published var showAlert = false
    
    
    init() {
        
    }
    
    func updateSettings() {
        if (selectedColorMode != nil) {
            SettingsData.mode = selectedColorMode ?? "light"
        }
        if (selectedSortMode != nil) {
            SettingsData.sort = selectedSortMode ?? "AZ"
            print("\(SettingsData.sort)")
        }
        return
    }
}
