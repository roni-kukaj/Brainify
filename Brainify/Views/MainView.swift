
import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isDarkMode = false
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            DecksView(userId: viewModel.currentUserId)
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
        .preferredColorScheme(SettingsData.mode == "light" ? .light : .dark)
    }
}

#Preview {
    MainView()
}
