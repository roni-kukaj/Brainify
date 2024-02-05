import SwiftUI

struct CustomRow: View {
    let flashCard: Flashcard
    
    var body: some View {
        HStack {
            VStack{
                Text(flashCard.question)
                Spacer()
                Text(flashCard.answer)
            }
        }
    }
}

#Preview {
    CustomRow(flashCard: Flashcard(id: "1", question: "q", answer: "Q"))
}
