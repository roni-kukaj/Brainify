

import Foundation
import FirebaseFirestore
import SwiftUI
import FirebaseAuth

class AddFlashcardViewViewModel: ObservableObject {
    @Published var question = ""
    @Published var answer = ""
    @Published var showAlert = false
    
    init() {
        
    }
    
    func saveFlashcard(deckId: String) {
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        
        let newFlashcard = Flashcard(
            id: newId,
            question: question,
            answer: answer
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("decks")
            .document(deckId)
            .collection("flashcards")
            .document(newId)
            .setData(newFlashcard.asDictionary())
    }
    
    var canSave: Bool {
        guard !question.trimmingCharacters(in: .whitespaces).isEmpty,
              !answer.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
}
