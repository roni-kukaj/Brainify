
import Foundation

struct SettingsData: Codable{
    /// Mode - color mode
    ///     - 0 for light mode
    ///     - 1 for dark mode
    static let mode = 0
    
    /// Sort - sorting mode
    ///     - 0 for A-Z
    ///     - 1 for Z-A
    ///     - 2 for Random
    static let sort = 0
}
