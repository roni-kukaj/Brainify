

import Foundation
import SwiftUI
import FirebaseFirestore

class FlashcardListViewViewModel: ObservableObject {
    @Published var showingAddFlashcardView = false
    @Published var showingEditFlashcardView = false
    
    private let userId: String
    private let deckId: String


    init(userId:String, deckId: String) {
        self.userId = userId
        self.deckId = deckId
    }
    
    func delete(userId: String, deckId: String, flashcardId: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("decks")
            .document(deckId)
            .collection("flashcards")
            .document(flashcardId)
            .delete()
    }
    
}
