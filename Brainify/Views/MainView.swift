
import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            DeckView()
        } else{
            RegisterView()
        }
    }
}

#Preview {
    MainView()
}
