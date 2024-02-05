
import SwiftUI
import FirebaseFirestoreSwift

struct FlashcardListView: View {
    @StateObject var viewModel: FlashcardListViewViewModel
    @FirestoreQuery var flashcards: [Flashcard]
        
    private var userId: String
    private static var editFlashcard = Flashcard(id: "", question: "", answer: "")
    private var deck_id: String
    @State private var deckId = "0"
    @State private var isPresenting: Bool = true
    
    init(userId: String, deckId: String){
        self.userId = userId
        self.deck_id = deckId
        self._viewModel = StateObject(
            wrappedValue: FlashcardListViewViewModel(userId: userId, deckId: deckId)
            )
        self._flashcards = FirestoreQuery(collectionPath: "users/\(userId)/decks/\(deckId)/flashcards")
        self.deckId = deckId
    }
    
    var body: some View {
        VStack {
            List(flashcards) { flashcard in
                CustomRow(flashCard: flashcard){
                    FlashcardListView.editFlashcard = flashcard
                    viewModel.showingEditFlashcardView = true
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Edit Flashcards")
        .sheet(isPresented: $viewModel.showingEditFlashcardView) {
            EditFlashcardView(userId: userId, deckId: self.deck_id, flashcard: FlashcardListView.editFlashcard)
        }
    }
}

//#Preview {
//    FlashcardListView(userId: "", deckId: "")

//}
