
import Foundation

struct Flashcard: Codable, Identifiable {
    let id: String
    let question: String
    let answer: String
}
