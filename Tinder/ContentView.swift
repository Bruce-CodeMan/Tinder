import SwiftUI

// Main content view of the application
struct ContentView: View {
    // State variable to remember the user's tab selection
    @State private var selection: TabItem = .home
    
    var body: some View {
        VStack{
            currentView(for: selection)
            Spacer()    // 占用最大的空间
            CustomTabBar(selection: $selection)
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

struct CustomTabBar: View {
    @Binding var selection: TabItem
    
    var body: some View {
        HStack {
            ForEach(TabItem.allCases, id: \.self){ tab in
                createTabBarItem(tab: tab, title: tab.title)
            }
        }
    }
    
    private func createTabBarItem(tab: TabItem, title: String) -> some View {
        Button {
            selection = tab
        } label: {
            VStack {
                Image(systemName: tab.rawValue)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(selection == tab ? Color.accentColor : Color.gray.opacity(0.5))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Text(title)
                    .font(.system(size: 10))
                    .foregroundStyle(selection == tab ? Color.accentColor : Color.gray.opacity(0.5))
            }
        }
    }
}

// Enum to define the tabs available in the app
enum TabItem: String, CaseIterable {
    case home = "rectangle.fill.on.rectangle.fill"
    case live = "play.tv.fill"
    case message = "message.fill"
    case profile = "person.fill"
    
    var iconName: String {
        self.rawValue
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .live:
            return "Live"
        case .message:
            return "Message"
        case .profile:
            return "Profile"
        }
    }
}

#Preview {
    ContentView()
}
