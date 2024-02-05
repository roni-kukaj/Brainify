

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
                Spacer()
                VStack {
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(flashcards) { flashcard in
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
                        ZStack{
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(hex: "#E8E8E8"))
                            Image(systemName: "pencil.and.outline")
                        }
                    }
                    .padding(20)
                }
            }
        }
        .toolbar {
            Button {
                viewModel.showingAddFlashcardView = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .navigationTitle("Flashcards")
        .sheet(isPresented: $viewModel.showingAddFlashcardView) {
            AddFlashcardView(newAddedFlashcard: $viewModel.showingAddFlashcardView, deckId: self.$deckId)
        }
    }
}

#Preview {
    FlashcardsView(userId: "", deckId: "")
}
