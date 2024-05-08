import SwiftUI

struct ContentView: View {
    
    // 导航栏数组
    var tabs: [TabBarItem] = [
        TabBarItem(title: "Home", icon: "rectangle.fill.on.rectangle.fill"),
        TabBarItem(title: "Live", icon: "play.tv.fill"),
        TabBarItem(title: "Message", icon: "message.fill"),
        TabBarItem(title: "Profile", icon: "person.fill")
    ]
    
    // 记住用户的选择
    @State var selection: TabBarItem = TabBarItem(title: "Home", icon: "rectangle.fill.on.rectangle.fill")
    
    var body: some View {
        VStack{
            Spacer()    // 占用最大的空间
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    createTabBarItem(tabBarItem: tab)
                        .onTapGesture {
                            selection = tab
                        }
                }
            }
        }
    }
    
    func createTabBarItem(tabBarItem: TabBarItem) -> some View {
        VStack {
            Image(systemName: tabBarItem.icon)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(selection == tabBarItem ? Color.accentColor : Color.gray.opacity(0.5))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            Text(tabBarItem.title)
                .font(.system(size: 10))
                .foregroundStyle(selection == tabBarItem ? Color.accentColor : Color.gray.opacity(0.5))
        }
    }
}

struct TabBarItem: Hashable {
    let title: String
    let icon: String
}

#Preview {
    ContentView()
}
