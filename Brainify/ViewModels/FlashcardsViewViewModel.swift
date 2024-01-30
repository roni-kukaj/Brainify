
import Foundation


class FlashcardsViewViewModel: ObservableObject {
    @Published var showingAddFlashcardView = false
    
    private let userId: String
    private let deckId: String
    
    
    init(userId:String, deckId: String) {
        self.userId = userId
        self.deckId = deckId
    }
}
