import Foundation

// MARK: - DEPRECATED: SampleData Class
// MVVM MIGRATION: This class has been replaced by ViewModels (FeedViewModel, PostDetailViewModel)
// The business logic has been moved to appropriate ViewModels for better separation of concerns
// This file is kept for reference and can be removed after confirming the MVVM implementation works correctly

/*
// OLD CODE - KEPT FOR REFERENCE
// This was the original SampleData class that handled all data and business logic
// It has been replaced by ViewModels in the MVVM architecture

class SampleData: ObservableObject {
    @Published var posts: [Post] = [
        Post(
            username: "john_photographer",
            userProfileImage: "person.circle.fill",
            postImage: "photo.on.rectangle",
            caption: "Beautiful sunset at the beach! 🌅 #sunset #photography #nature",
            likes: 142,
            comments: [
                Comment(username: "sarah_travels", text: "Amazing shot! 📸", timestamp: Date().addingTimeInterval(-3600)),
                Comment(username: "mike_outdoors", text: "Love the colors!", timestamp: Date().addingTimeInterval(-1800)),
                Comment(username: "emma_art", text: "This is so peaceful 🧘‍♀️", timestamp: Date().addingTimeInterval(-900))
            ],
            timestamp: Date().addingTimeInterval(-7200)
        ),
        
        Post(
            username: "foodie_adventures",
            userProfileImage: "person.circle.fill",
            postImage: "fork.knife.circle",
            caption: "Homemade pasta with fresh basil 🍝 Recipe in my bio! #cooking #pasta #homemade",
            likes: 89,
            comments: [
                Comment(username: "chef_maria", text: "Looks delicious! 😋", timestamp: Date().addingTimeInterval(-2700)),
                Comment(username: "italian_lover", text: "Perfetto! 👌", timestamp: Date().addingTimeInterval(-1200))
            ],
            timestamp: Date().addingTimeInterval(-14400)
        ),
        
        Post(
            username: "tech_enthusiast",
            userProfileImage: "person.circle.fill",
            postImage: "laptopcomputer",
            caption: "Working on my latest SwiftUI project! Love how declarative UI makes development so much easier 💻 #swiftui #ios #coding",
            likes: 234,
            comments: [
                Comment(username: "ios_dev", text: "SwiftUI is amazing! 🚀", timestamp: Date().addingTimeInterval(-5400)),
                Comment(username: "app_builder", text: "Can't wait to see the final result!", timestamp: Date().addingTimeInterval(-3600)),
                Comment(username: "swift_coder", text: "Declarative UI FTW! 💪", timestamp: Date().addingTimeInterval(-2100))
            ],
            timestamp: Date().addingTimeInterval(-21600)
        ),
        
        Post(
            username: "nature_explorer",
            userProfileImage: "person.circle.fill",
            postImage: "tree.fill",
            caption: "Morning hike in the mountains. Fresh air and beautiful views! 🏔️ #hiking #nature #mountains #adventure",
            likes: 167,
            comments: [
                Comment(username: "mountain_climber", text: "Which trail is this?", timestamp: Date().addingTimeInterval(-4800)),
                Comment(username: "outdoor_life", text: "Perfect weather for hiking! ☀️", timestamp: Date().addingTimeInterval(-2400))
            ],
            timestamp: Date().addingTimeInterval(-28800)
        ),
        
        Post(
            username: "coffee_lover",
            userProfileImage: "person.circle.fill",
            postImage: "cup.and.saucer.fill",
            caption: "Perfect latte art to start the day ☕️ Nothing beats a good cup of coffee in the morning! #coffee #latteart #morning",
            likes: 98,
            comments: [
                Comment(username: "barista_pro", text: "Beautiful rosetta! 🌹", timestamp: Date().addingTimeInterval(-6300)),
                Comment(username: "coffee_addict", text: "I need this right now! ☕️", timestamp: Date().addingTimeInterval(-3900))
            ],
            timestamp: Date().addingTimeInterval(-36000)
        )
    ]
    
    func addComment(to postId: UUID, comment: Comment) {
        if let index = posts.firstIndex(where: { $0.id == postId }) {
            posts[index].comments.append(comment)
        }
    }
    
    func toggleLike(for postId: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postId }) {
            posts[index].likes += 1
        }
    }
}

// OLD CODE - KEPT FOR REFERENCE
// This extension provided stories data
extension SampleData {
    var stories: [Story] {
        return [
            Story(username: "Mohamed", imageName: "person.circle.fill"),
            Story(username: "Mohamed", imageName: "person.circle.fill"),
            Story(username: "Mohamed", imageName: "person.circle.fill"),
            Story(username: "Mohamed", imageName: "person.circle.fill"),
            Story(username: "Mohamed", imageName: "person.circle.fill"),
            Story(username: "Mohamed", imageName: "person.circle.fill"),
            Story(username: "Mohamed", imageName: "person.circle.fill"),
            Story(username: "Mohamed", imageName: "person.circle.fill")
        ]
    }
}
*/

// MARK: - MVVM ARCHITECTURE NOTES
/*
MVVM MIGRATION SUMMARY:

1. CREATED NEW VIEWMODELS:
   - FeedViewModel: Handles feed data and business logic
   - PostDetailViewModel: Handles post detail interactions

2. UPDATED VIEWS:
   - FeedView: Now uses FeedViewModel instead of SampleData
   - PostRowView: Now uses FeedViewModel for like functionality
   - PostDetailView: Now uses PostDetailViewModel for comment posting and like toggling

3. BENEFITS OF MVVM:
   - Better separation of concerns
   - Easier testing (ViewModels can be tested independently)
   - More maintainable code structure
   - Reusable business logic
   - Better state management

4. NEXT STEPS:
   - This SampleData.swift file can be safely deleted after confirming MVVM implementation works
   - Consider adding more ViewModels for other features (UserProfile, Search, etc.)
   - Add unit tests for ViewModels
   - Consider adding a Repository layer for data access
*/
