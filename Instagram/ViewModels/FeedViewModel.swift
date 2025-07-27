import Foundation
import SwiftUI

// MARK: - FeedViewModel
// MVVM Architecture: This ViewModel handles the business logic for the feed
// Replaces direct SampleData usage in views with proper separation of concerns
class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var stories: [Story] = []
    @Published var isLoading: Bool = false
    
    // MARK: - Initialization
    init() {
        loadInitialData()
    }
    
    // MARK: - Data Loading
    private func loadInitialData() {
        isLoading = true
        
        // Simulate network delay for better UX
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.posts = self.createSamplePosts()
            self.stories = self.createSampleStories()
            self.isLoading = false
        }
    }
    
    // MARK: - Business Logic Methods
    func toggleLike(for postId: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postId }) {
            posts[index].likes += 1
        }
    }
    
    func addComment(to postId: UUID, comment: Comment) {
        if let index = posts.firstIndex(where: { $0.id == postId }) {
            posts[index].comments.append(comment)
        }
    }
    
    func refreshFeed() {
        loadInitialData()
    }
    
    // MARK: - Sample Data Creation (Previously in SampleData.swift)
    private func createSamplePosts() -> [Post] {
        return [
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
    }
    
    private func createSampleStories() -> [Story] {
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