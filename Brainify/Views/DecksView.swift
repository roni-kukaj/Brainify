
import SwiftUI
import FirebaseFirestoreSwift

struct DecksView: View {
    @StateObject var viewModel = DecksViewViewModel()
    @FirestoreQuery var decks: [Deck]
        
    init(userId: String) {
        self._decks = FirestoreQuery(collectionPath: "users/\(userId)/decks")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(decks) { deck in
                    SingleDeckView(deck: deck)
                }
                .listStyle(PlainListStyle())
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