import SwiftUI

struct UserCardView: View {
    var userCard: UserCard
    @State var imageIndex = 0
    var body: some View {
        // 获取不同手机型号的宽度和高度
        GeometryReader { proxy in
            let frameWidth = proxy.size.width
            let frameHeight = proxy.size.height
            Image(userCard.photos[imageIndex])
                .resizable()
                .frame(width: frameWidth, height: frameHeight)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack {
                Rectangle()
                    .onTapGesture {
                        updateImageIndex(hasMoreIndex: false)
                    }
                Rectangle()
                    .onTapGesture {
                        updateImageIndex(hasMoreIndex: true)
                    }
            }
            .foregroundStyle(Color.white.opacity(0.01))
            HStack {
                ForEach(0..<userCard.photos.count, id: \.self) { imageIndex in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 4)
                        .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray)
                }
            }
            .padding(.top, 10)
            .padding(.horizontal)
        }
    }
    
    func updateImageIndex(hasMoreIndex: Bool) {
        let nextIndex = hasMoreIndex ? imageIndex + 1 : imageIndex - 1
        imageIndex = min(max(0, nextIndex), userCard.photos.count - 1)
        
    }
}

#Preview {
    UserCardView(userCard: UserCard(name: "Bruce", age: 18, place: "China", zodiac: "Cancer", photos: ["User1", "User2"]))
}
