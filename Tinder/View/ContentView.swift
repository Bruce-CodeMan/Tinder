import SwiftUI

// Main content view of the application
struct ContentView: View {
    // State variable to remember the user's tab selection
    @StateObject var appStore = AppState()
    
    var body: some View {
        VStack{
            currentView(for: appStore.selectedTab)
            if !appStore.isFullScreen {
                Spacer()
                CustomTabBar(selection: $appStore.selectedTab)
            }
        }
    }
    
    @ViewBuilder private func currentView(for tab: TabItem) -> some View {
        switch tab {
        case .home:
            Text("Home")
        case .live:
            Text("Live")
        case .message:
            Text("Message")
        case .profile:
            Text("Profile")
        }
    }
    
}

#Preview {
    ContentView()
}
