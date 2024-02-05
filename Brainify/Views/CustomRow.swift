import SwiftUI

struct CustomRow: View {
    let flashCard: Flashcard
    let action: () -> Void
    
    var body: some View {
        HStack {
            VStack{
                Text(flashCard.question)
                    .bold()
                Spacer()
                Text(flashCard.answer)
            }
            Spacer()
            Button{
                action()
            } label: {
                Image(systemName: "pencil.circle")
                    .frame(width: 15, height: 15)
            }
        }
        .padding(10)
    }
}

#Preview {
    CustomRow(flashCard: Flashcard(id: "1", question: "q", answer: "Q")){
        
    }
}
