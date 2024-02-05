import Foundation
import SwiftUI

class ViewFactory {
    static func setViewForDestination(_ destination: AppNavigation, userId: String, deckId: String) -> AnyView {
        switch destination {
        case .flashcards:
            return AnyView(FlashcardsView(userId: userId, deckId: deckId))
        case .flashcardList:
            return AnyView(FlashcardListView(userId: userId, deckId: deckId))
        }
    }
}
