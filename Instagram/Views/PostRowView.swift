import SwiftUI

// MARK: - PostRowView
// MVVM Architecture: This view now uses FeedViewModel instead of direct SampleData access
// The view is now purely responsible for UI presentation, business logic moved to ViewModel
struct PostRowView: View {
    // MVVM: Replace @EnvironmentObject var sampleData: SampleData with ViewModel parameter
    let post: Post
    let viewModel: FeedViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header
            headerView
            
            // Post Image
            postImage
            
            // Action Buttons
            actionButtons
            
            // Likes
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.bold)
                .padding(.horizontal, 8)
                .padding(.bottom, 2)
            
            // Caption
            Text("**\(post.username)** \(post.caption)")
                .font(.footnote)
                .padding(.horizontal, 8)
                .padding(.bottom, 2)
            
            // Comments Summary
            if !post.comments.isEmpty {
                Text("View all \(post.comments.count) comments")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 2)
            }
            
            // Timestamp
            Text(post.formattedTimestamp)
                .font(.caption2)
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
        }
    }
    
    private var headerView: some View {
        HStack {
            Image(systemName: post.userProfileImage)
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            Text(post.username)
                .font(.headline)
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding([.horizontal, .bottom], 8)
    }
    
    private var postImage: some View {
        Image(systemName: post.postImage)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
    }
    
    private var actionButtons: some View {
        HStack {
            // MVVM: Use viewModel.toggleLike instead of sampleData.toggleLike
            Button {
                viewModel.toggleLike(for: post.id)
            } label: {
                Image(systemName: post.likes > 0 ? "heart.fill" : "heart")
                    .foregroundColor(post.likes > 0 ? .red : .primary)
            }

            Button(action: {}) {
                Image(systemName: "message")
            }
            Button(action: {}) {
                Image(systemName: "paperplane")
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "bookmark")
            }
        }
        .font(.title2)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
}

// MARK: - Preview
struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        // MVVM: Update preview to use ViewModel
        PostRowView(
            post: FeedViewModel().posts.first ?? Post(
                username: "test_user",
                userProfileImage: "person.circle.fill",
                postImage: "photo.on.rectangle",
                caption: "Test post",
                likes: 0,
                comments: [],
                timestamp: Date()
            ),
            viewModel: FeedViewModel()
        )
        .previewLayout(.sizeThatFits)
    }
}

