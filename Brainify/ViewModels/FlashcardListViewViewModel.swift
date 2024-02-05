

import Foundation
import SwiftUI

class FlashcardListViewViewModel: ObservableObject {
    @Published var showingAddFlashcardView = false
    @Published var showingEditFlashcardView = false
    
    private let userId: String
    private let deckId: String


    init(userId:String, deckId: String) {
        self.userId = userId
        self.deckId = deckId
    }
    
    
}
