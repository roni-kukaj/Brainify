
import SwiftUI

struct DeckView: View {
    @StateObject var viewModel = DeckViewViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
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
                AddDeckView()
            }
        }
    }
}

#Preview {
    DeckView(userId: "")
}
