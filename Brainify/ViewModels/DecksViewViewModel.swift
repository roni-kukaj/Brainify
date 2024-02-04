
import Foundation
import FirebaseFirestore

class DecksViewViewModel: ObservableObject {
    @Published var showingAddDeckView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("decks")
            .document(id)
            .delete()
        func delete(id: String) {
            print()
        }
    }
}
