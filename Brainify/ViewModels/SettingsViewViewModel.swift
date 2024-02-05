

import Foundation

class SettingsViewViewModel: ObservableObject {
    @Published var selectedColorMode = ""
    @Published var selectedSortMode = ""
    
    init() {
        
    }
    
    func updateSettings() {
        if selectedColorMode == "" || selectedSortMode == "" {
            return
        }
        else {
            SettingsData.mode = selectedSortMode
            
        }
    }
}
