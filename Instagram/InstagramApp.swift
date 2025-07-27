//
//  InstagramApp.swift
//  Instagram
//
//  Created by amr.khafaga on 20/07/2025.
//

import SwiftUI

@main
struct InstagramApp: App {
    // MVVM: Remove @StateObject var sampleData = SampleData() since we're using ViewModels now
    // Each view will have its own ViewModel instance
    
    var body: some Scene {
        WindowGroup {
            // MVVM: Remove .environmentObject(sampleData) since we're using ViewModels
            FeedView()
        }
    }
}
