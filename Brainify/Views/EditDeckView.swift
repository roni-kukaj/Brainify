
import SwiftUI

struct EditDeckView: View {
    @StateObject var viewModel = EditDeckViewViewModel()
    @Binding var newAddedItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("Edit Deck")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Spacer()
            
            Form {
                CustomButton(title: "Save Changes",
                             background: Color(hex: "#78C1F3")){
                    newAddedItemPresented = false
                }
            }
        }
    }
}

#Preview {
    EditDeckView(newAddedItemPresented: Binding(get: {
        return true
    }, set: {_ in
        
    }))
}
