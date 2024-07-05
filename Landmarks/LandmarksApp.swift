/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The top-level definition of the Landmarks app.
*/

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    @State private var profileData = ProfileModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
                .environment(profileData)
        }
    }
}
