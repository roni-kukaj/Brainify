
import Foundation
import FirebaseFirestore
import SwiftUI
import FirebaseAuth

class AddDeckViewViewModel: ObservableObject {
    @Published var deckName = ""
    @Published var deckSubject = ""
    @Published var color: Color = Color("#78C1F3")
    @Published var showAlert = false
    
    init() {
        
        
    }
    
    func saveDeck() {
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        
        let newDeck = Deck(
            id: newId,
            deckName: deckName,
            deckSubject: deckSubject,
            color: String(describing: color)
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("decks")
            .document(newId)
            .setData(newDeck.asDictionary())
    }
    
    var canSave: Bool {
        guard !deckName.trimmingCharacters(in: .whitespaces).isEmpty,
              !deckSubject.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
}
