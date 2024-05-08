import SwiftUI

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
