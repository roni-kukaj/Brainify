
import Foundation
import SwiftUI

class AddDeckViewViewModel: ObservableObject {
    @Published var deckName = ""
    @Published var deckSubject = ""
    @Published var color: Color = Color("#FFFFFF")
    
    init() {
        
        
    }
    
    func saveDeck() {
        
    }
}
