
import SwiftUI

struct AddDeckView: View {
    @StateObject var viewModel = AddDeckViewViewModel()
    @Binding var newItemPresented: Bool

    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Spacer()
            Form {
                TextField("Enter deck name", text: $viewModel.deckName)
                
                TextField("Enter deck subject", text: $viewModel.deckSubject)
                
                ColorPicker("Select a deck color", selection: $viewModel.color, supportsOpacity: false)
                
                CustomButton(title: "Save",
                             background: Color(hex: "#78C1F3")) {
                    if viewModel.canSave {
                        viewModel.saveDeck()
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all the fields"))
            }
        }
    }
}

#Preview {
    AddDeckView(newItemPresented: Binding(get: {
        return true
    }, set: {_ in
        
    }))
}
