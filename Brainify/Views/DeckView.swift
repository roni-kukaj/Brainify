
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
                    
                } label: {
                    Image(systemName: "folder.badge.plus")
                }
            }
        }
    }
}

#Preview {
    DeckView(userId: "")
}
