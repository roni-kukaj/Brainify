
import SwiftUI

struct AddFlashcardView: View {
    @StateObject var viewModel = AddFlashcardViewViewModel()
    @Binding var newAddedFlashcard: Bool
    @Binding var deckId: String
    
    
    var body: some View {
        VStack{
            Text("New Flashcard")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Spacer()
            Form {
                TextField("Enter question", text: $viewModel.question)
                
                TextField("Enter answer", text: $viewModel.answer)
                
                CustomButton(title: "Add Question",
                             background: Color(hex: "#78C1F3")) {
                    if viewModel.canSave {
                        viewModel.saveFlashcard(deckId: deckId)
                        newAddedFlashcard = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all the fields"))
            }
        }
    }
}

#Preview {
    AddFlashcardView(newAddedFlashcard: Binding(get: {
        return true
    }, set: {_ in
        
    }), deckId: Binding(get: {
        return "true"
    }, set: {_ in
        
    }))
}

