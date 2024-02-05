
import Foundation
import SwiftUI

class ViewFlow: ObservableObject {
    static let shared = ViewFlow()
    
    @Published var path = NavigationPath()
    @Published var selectedDeck: Deck = Deck(id: "", deckName: "", deckSubject: "")
    
    func clear() {
        path = .init()
    }
    
    func navigateBackToRoot() {
        path.removeLast(path.count)
    }
    
    func backToPrevious() {
        path.removeLast()
    }
    
    func navigateToFlashcardsView() {
        path.append(AppNavigation.flashcards)
    }
    
    func navigateToFlashcardListView() {
        path.append(AppNavigation.flashcardList)
    }
    
    func done() {
        path = .init()
    }
    
}
