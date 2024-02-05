
import Foundation
import FirebaseFirestore
import Firebase

class EditFlashcardViewViewModel: ObservableObject {
    @Published var flashcardQuestion = ""
    @Published var flashcardAnswer = ""
    @Published var showAlert = false
    
    init() {
    }
    
    func updateFlashcard(userId: String, deckId: String, flashcardId: String) {
        guard canSave else {
            return
        }
        
        let flashcardData = Flashcard(
            id: flashcardId,
            question: flashcardQuestion,
            answer: flashcardAnswer
        )
        
        let db = Firestore.firestore()
        let flashcard = db.collection("users").document(userId).collection("decks").document(deckId).collection("flashcards").document(flashcardId)
        flashcard.updateData(flashcardData.asDictionary())
    }
    
    var canSave: Bool {
        guard !flashcardQuestion.trimmingCharacters(in: .whitespaces).isEmpty,
              !flashcardAnswer.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
}
