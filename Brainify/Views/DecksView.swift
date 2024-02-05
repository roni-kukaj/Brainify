
import SwiftUI
import FirebaseFirestoreSwift

struct DecksView: View {
    @StateObject var viewModel: DecksViewViewModel
    @FirestoreQuery var decks: [Deck]
    
    private var userId: String
    
    init(userId: String) {
        self._decks = FirestoreQuery(collectionPath: "users/\(userId)/decks")
        self._viewModel = StateObject(
            wrappedValue: DecksViewViewModel(userId: userId)
        )
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(decks) { deck in
                    NavigationLink {
                        FlashcardsView(userId: userId, deckId: deck.id)
                    } label: {
                        SingleDeckView(deck: deck)
                            .swipeActions {
                                HStack{
                                    Button {
                                        viewModel.delete(id: deck.id)
                                    } label: {
                                        Text("Delete")
                                    }
                                    .tint(.red)
                                }
                            }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Decks")
            .toolbar {
                Button {
                    viewModel.showingAddDeckView = true
                } label: {
                    Image(systemName: "folder.badge.plus")
                }
            }
            .sheet(isPresented: $viewModel.showingAddDeckView) {
                AddDeckView(newItemPresented: $viewModel.showingAddDeckView)
            }
        }
    }
}
#Preview {
    DecksView(userId: "YtP3sqyR3yWVdHVKpBu970BENW43")
}
