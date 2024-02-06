
import Foundation


class FlashcardsViewViewModel: ObservableObject {
    @Published var showingAddFlashcardView = false
    
    private let userId: String
    private let deckId: String
    
    
    init(userId:String, deckId: String) {
        self.userId = userId
        self.deckId = deckId
    }
    
    func sortAZ(_ array: inout [Flashcard]) -> [Flashcard] {
        array.sort()
        return array
    }
    func sortZA(_ array: inout [Flashcard]) -> [Flashcard] {
        array.sort(by: {$0.question > $1.question})
        return array
    }
    func sortRandom(_ array: inout [Flashcard]) -> [Flashcard] {
        array.shuffle()
        return array
    }
}
