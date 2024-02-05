
import SwiftUI

struct EditFlashcardView: View {
    @StateObject var viewModel = EditFlashcardViewViewModel()
    private var userId: String
    private var deckId: String
    private var flashcard: Flashcard
    public static var newEdit = false
    
    init(userId: String, deckId: String, flashcard: Flashcard){
        self.userId = userId
        self.deckId = deckId
        self.flashcard = flashcard
    }
    
    var body: some View {
        VStack{
            Text("Edit Flashcard")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Spacer()
            Form {
                TextField("Enter flashcard question", text: $viewModel.flashcardQuestion)
                
                TextField("Enter flashcard question", text: $viewModel.flashcardAnswer)
                
                CustomButton(title: "Save Changes", background: Color(hex: "#78C1F3")){
                    if viewModel.canSave {
                        viewModel.updateFlashcard(userId: userId, deckId: deckId, flashcardId: flashcard.id)
                        EditFlashcardView.newEdit = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill in all the fields"))
            }
        }
    }
}

//#Preview {
//    EditFlashcardView()
//}
