import SwiftUI

struct ContentView: View {
    private var userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            
        }
    }
}

#Preview {
    ContentView(userId: "1")
}
