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
