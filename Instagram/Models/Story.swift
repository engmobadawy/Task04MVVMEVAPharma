import Foundation

// MARK: - Story Model
// MVVM Architecture: This model represents a story in the Instagram app
// Moved from SampleData.swift to its own file for better organization
struct Story: Identifiable {
    let id = UUID()
    let username: String
    let imageName: String
} 