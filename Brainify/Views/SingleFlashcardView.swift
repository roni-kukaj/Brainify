
import SwiftUI

struct SingleFlashcardView: View {
    let flashcard: Flashcard
    
    @State private var isShowingAnswer = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)
            
            VStack {
                Text(flashcard.question)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                if isShowingAnswer {
                    Text(flashcard.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
                
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 250)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

#Preview {
    SingleFlashcardView(flashcard: Flashcard(id: "123", question: "Who was the first USA President?", answer: "George Washington"))
}
