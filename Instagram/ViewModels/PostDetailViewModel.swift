import Foundation
import SwiftUI

// MARK: - PostDetailViewModel
// MVVM Architecture: This ViewModel handles the business logic for post detail interactions
// Manages comment posting, like toggling, and other post-specific operations
class PostDetailViewModel: ObservableObject {
    @Published var post: Post
    @Published var newComment: String = "" {
        didSet {
            onCommentChanged?(newComment)
        }
    }
    @Published var isPostingComment: Bool = false
    
    // Closure-based binding: Called whenever newComment changes
    var onCommentChanged: ((String) -> Void)?
    
    // MARK: - Initialization
    init(post: Post) {
        self.post = post
    }
    
    // MARK: - Business Logic Methods
    func toggleLike() {
        post.likes += 1
    }
    
    func postComment() {
        guard !newComment.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        isPostingComment = true
        
        // Simulate network delay for better UX
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let comment = Comment(
                username: "current_user",
                text: self.newComment.trimmingCharacters(in: .whitespacesAndNewlines),
                timestamp: Date()
            )
            
            self.post.comments.append(comment)
            self.newComment = ""
            self.isPostingComment = false
        }
    }
    
    func canPostComment() -> Bool {
        return !newComment.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !isPostingComment
    }
    
    func clearComment() {
        newComment = ""
    }
    
    // MARK: - Computed Properties
    var commentCount: Int {
        return post.comments.count
    }
    
    var hasComments: Bool {
        return !post.comments.isEmpty
    }
    
    var isLiked: Bool {
        return post.likes > 0
    }
} 