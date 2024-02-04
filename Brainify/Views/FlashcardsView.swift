

import SwiftUI
import FirebaseFirestoreSwift

struct FlashcardsView: View {
    @StateObject var viewModel: FlashcardsViewViewModel
    @FirestoreQuery var flashcards: [Flashcard]
    
    private var userId: String
    @State private var deckId: String
    
    init(userId: String, deckId: String){
        self._viewModel = StateObject(
            wrappedValue: FlashcardsViewViewModel(userId: userId, deckId: deckId)
            )
        self._flashcards = FirestoreQuery(collectionPath: "users/\(userId)/decks/\(deckId)/flashcards")
        self.userId = userId
        self.deckId = deckId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(flashcards) { flashcard in
                    
                    SingleFlashcardView(flashcard: flashcard)
                }
                .listStyle(PlainListStyle())
            }
        }
        .toolbar {
            Button {
                viewModel.showingAddFlashcardView = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $viewModel.showingAddFlashcardView) {
            AddFlashcardView(newAddedFlashcard: $viewModel.showingAddFlashcardView, deckId: self.$deckId)
        }
    }
}

#Preview {
    FlashcardsView(userId: "", deckId: "")
}
