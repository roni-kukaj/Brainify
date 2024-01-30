
import SwiftUI

struct SingleDeckView: View {
    let deck: Deck
    var body: some View {
        VStack (alignment: .leading){
            Text(deck.deckName)
                .font(.title)
                .bold()
            Text(deck.deckSubject)
                .font(.subheadline)
                
        }
    }
        
}

#Preview {
    SingleDeckView(
        deck: .init(
            id: "123",
            deckName: "Deck1",
            deckSubject: "Math"
        )
    )
}
