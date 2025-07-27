// MARK: - StoryView
// MVVM Architecture: This view displays stories in a horizontal scroll view
// The view is purely responsible for UI presentation, no business logic here
import SwiftUI

struct StoryView: View {
    let stories: [Story]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(stories) { story in
                    VStack {
                        // Story Circle
                        Image(systemName: story.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.red, lineWidth: 2.5))
                        
                        // Username
                        Text(story.username)
                            .font(.caption)
                    }
                    .frame(width: 80)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
        }
    }
}

// MARK: - Preview
struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(stories: [
            Story(username: "User1", imageName: "person.circle.fill"),
            Story(username: "User2", imageName: "person.circle.fill"),
            Story(username: "User3", imageName: "person.circle.fill")
        ])
    }
}

/*
// OLD CODE - KEPT FOR REFERENCE
// This Story model definition was previously in this file
// It has been moved to Models/Story.swift for better organization

struct Story: Identifiable {
    let id = UUID()
    let username: String
    let imageName: String
}
*/


