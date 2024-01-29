
import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView {
                DeckView()
                    .tabItem {
                        Label("Decks", systemImage: "folder")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
                
                AboutView()
                    .tabItem {
                        Label("Info", systemImage: "info.circle.fill")
                    }
            }
        } else{
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
