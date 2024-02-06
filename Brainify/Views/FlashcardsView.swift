

import SwiftUI
import FirebaseFirestoreSwift

struct FlashcardsView: View {
    @StateObject var viewModel: FlashcardsViewViewModel
    @FirestoreQuery var flashcards: [Flashcard]
    
    private var userId: String
    @State private var deckId: String
    private var nextView = false;
    
    init(userId: String, deckId: String){
        self._viewModel = StateObject(
            wrappedValue: FlashcardsViewViewModel(userId: userId, deckId: deckId)
            )
        self._flashcards = FirestoreQuery(collectionPath: "users/\(userId)/decks/\(deckId)/flashcards")
        self.userId = userId
        self.deckId = deckId
    }
    
    var sortedFlashcards: [Flashcard] {
        switch SettingsData.sort {
        case "AZ":
            return flashcards.sorted(by: {$0.question < $1.question})
        case "ZA":
            return flashcards.sorted(by: {$0.question > $1.question})
        case "Random":
            return flashcards.shuffled()
        default:
            return flashcards
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(sortedFlashcards) { flashcard in
                            SingleFlashcardView(flashcard: flashcard)
                                .padding(6)
                        }
                        .frame(height: 280)
                    }.padding(5)
                }
            }
            Spacer()
            HStack{
                Spacer()
                NavigationLink {
                    FlashcardListView(userId: self.userId, deckId: self.deckId)
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color(hex: "#E8E8E8"))
                        Image(systemName: "pencil.and.outline")
                    }
                }
                .padding(20)
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
        .navigationTitle("Flashcards")
    }
}

#Preview {
    FlashcardsView(userId: "", deckId: "")
}
