
import Foundation

struct Flashcard: Codable, Identifiable, Comparable {
    let id: String
    let question: String
    let answer: String
    
    static func < (lhs: Flashcard, rhs: Flashcard) -> Bool {
        return lhs.question < rhs.question
    }
}
