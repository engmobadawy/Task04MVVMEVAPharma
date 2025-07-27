import SwiftUI

// MARK: - FeedView
// MVVM Architecture: This view now uses FeedViewModel instead of direct SampleData access
// The view is now purely responsible for UI presentation, business logic moved to ViewModel
struct FeedView: View {
    // MVVM: Replace @EnvironmentObject var sampleData: SampleData with ViewModel
    @StateObject private var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 0) {
                    // MVVM: Use viewModel.stories instead of sampleData.stories
                    StoryView(stories: viewModel.stories)
                        .padding(.bottom, 8)
                    
                    Divider()
                    
                    // MVVM: Use viewModel.posts instead of sampleData.posts
                    ForEach(viewModel.posts) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            PostRowView(post: post, viewModel: viewModel)
                                .foregroundColor(.primary)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Divider()
                            .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Instagram")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "camera")
                        .font(.title2)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .font(.title2)
                }
            }
            // MVVM: Add loading state handling
            .overlay(
                Group {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.black.opacity(0.1))
                    }
                }
            )
        }
    }
}

// MARK: - Preview
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
