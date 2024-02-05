
import SwiftUI
import FirebaseFirestoreSwift

struct FlashcardListView: View {
    @Environment(\.presentationMode) var mode
    @StateObject var viewModel: FlashcardListViewViewModel
    @FirestoreQuery var flashcards: [Flashcard]
    
    private var userId: String
    @State private var deckId = "0"
    @State private var isPresenting: Bool = true
    
    init(userId: String, deckId: String){
        self.userId = userId
        self._viewModel = StateObject(
            wrappedValue: FlashcardListViewViewModel(userId: userId, deckId: deckId)
            )
        self._flashcards = FirestoreQuery(collectionPath: "users/\(userId)/decks/\(deckId)/flashcards")
        self.deckId = deckId
    }
    
    var body: some View {
        Text("")
        NavigationView {
            
        }
        .fullScreenCover(isPresented: $isPresenting, content: {
            
            VStack {
                List(flashcards) { flashcard in
                    
                    Text(flashcard.question)
                    Text(flashcard.answer)
                }
                .listStyle(PlainListStyle())
            }
        })
        .navigationTitle("All Flashcards")
    }
}

#Preview {
    FlashcardListView(userId: "", deckId: "")
}
