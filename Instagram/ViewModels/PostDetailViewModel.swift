import Foundation
import SwiftUI


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
    

    init(post: Post) {
        self.post = post
    }
    
    
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
