
import SwiftUI

struct AddDeckView: View {
    @StateObject var viewModel = AddDeckViewViewModel()

    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            Spacer()
            Form {
                TextField("Enter deck name", text: $viewModel.deckName)
                
                TextField("Enter deck subject", text: $viewModel.deckSubject)
                
                ColorPicker("Select a deck color", selection: $viewModel.color, supportsOpacity: false)
                
                CustomButton(title: "Save",
                             background: Color(hex: "#78C1F3")) {
                    viewModel.saveDeck()
                }
                .padding()
            }
        }
    }
}

#Preview {
    AddDeckView()
}
