import Foundation

struct Post: Identifiable {
    let id = UUID() 
    let username: String
    let userProfileImage: String
    let postImage: String
    let caption: String
    var likes: Int
    var comments: [Comment]
    let timestamp: Date
    
    // Computed property for formatted timestamp
    var formattedTimestamp: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: timestamp, relativeTo: Date())
    }
}

