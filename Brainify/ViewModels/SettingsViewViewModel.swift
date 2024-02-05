

import Foundation

class SettingsViewViewModel: ObservableObject {
    @Published var selectedColorMode = ""
    @Published var selectedSortMode = ""
    @Published var colorOptions = ["light", "dark"]
    @Published var sortOptions = ["AZ", "ZA", "Random"]
    
    
    init() {
        
    }
    
    func updateSettings() {
        
    }
}
