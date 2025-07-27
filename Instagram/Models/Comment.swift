import Foundation

struct Comment: Identifiable {
    let id = UUID()
    let username: String
    let text: String
    let timestamp: Date
}

