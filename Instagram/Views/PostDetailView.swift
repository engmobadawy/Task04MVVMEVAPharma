import SwiftUI

// MARK: - PostDetailView
// MVVM Architecture: This view now uses PostDetailViewModel instead of direct SampleData access
// The view is now purely responsible for UI presentation, business logic moved to ViewModel
struct PostDetailView: View {
    // MVVM: Replace @EnvironmentObject var sampleData: SampleData with ViewModel
    @StateObject private var viewModel: PostDetailViewModel
    let post: Post
    
    // MARK: - Initialization
    init(post: Post) {
        self.post = post
        // MVVM: Initialize ViewModel with the post
        let vm = PostDetailViewModel(post: post)
        // Closure-based binding: Print whenever newComment changes
        vm.onCommentChanged = { newValue in
            print("[Closure] newComment changed to: \(newValue)")
        }
        self._viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Header
                HStack {
                    Image(systemName: post.userProfileImage)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(post.username)
                            .font(.headline)
                        Text(post.formattedTimestamp)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                    }
                }
                .padding()
                
                // Post Image
                Image(systemName: post.postImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                
                // Action Buttons
                HStack {
                    // MVVM: Use viewModel.toggleLike instead of sampleData.toggleLike
                    Button(action: {
                        viewModel.toggleLike()
                    }) {
                        Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                            .foregroundColor(viewModel.isLiked ? .red : .primary)
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
                .padding(.horizontal)
                .padding(.vertical, 8)
                
                // Likes
                Text("\(viewModel.post.likes) likes")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.bottom, 4)
                
                // Caption
                VStack(alignment: .leading, spacing: 4) {
                    Text("**\(post.username)** \(post.caption)")
                        .font(.subheadline)
                        .padding(.horizontal)
                }
                .padding(.bottom, 16)
                
                // Comments Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Comments")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    // MVVM: Use viewModel.post.comments instead of post.comments
                    ForEach(viewModel.post.comments) { comment in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(alignment: .top) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("**\(comment.username)** \(comment.text)")
                                        .font(.footnote)
                                    
                                    HStack {
                                        Text(comment.timestamp, style: .relative)
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                        
                                        Button("Reply") {}
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                Spacer()
                                
                                Button(action: {}) {
                                    Image(systemName: "heart")
                                        .font(.caption)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                    }
                }
                
                Spacer(minLength: 80) // Space for comment input
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {
            // Comment Input
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                // MVVM: Use viewModel.newComment instead of @State private var newComment
                TextField("Add a comment...", text: $viewModel.newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // MVVM: Use viewModel.postComment instead of direct SampleData access
                Button("Post") {
                    viewModel.postComment()
                }
                .disabled(!viewModel.canPostComment())
                .opacity(viewModel.isPostingComment ? 0.6 : 1.0)
            }
            .padding()
            .background(Color(UIColor.systemBackground))
        }
    }
}

// MARK: - Preview
struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostDetailView(post: FeedViewModel().posts.first ?? Post(
                username: "test_user",
                userProfileImage: "person.circle.fill",
                postImage: "photo.on.rectangle",
                caption: "Test post",
                likes: 0,
                comments: [],
                timestamp: Date()
            ))
        }
    }
}

