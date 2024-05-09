import SwiftUI

struct UserCardView: View {
    var userCard: UserCard
    @State var imageIndex = 0
    @State var offset: CGSize = .zero
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
            VStack{
                HStack {
                    if offset.width > 0 {
                        createUserCardLabel(title: "LIKE", degree: -20, color: Color.green)
                        Spacer()
                    }
                    if offset.width < 0 {
                        Spacer()
                        createUserCardLabel(title: "NOPE", degree: 20, color: Color.red)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 40)
                Spacer()
                createUserCardBottomInfo()
            }
        }
        .offset(offset)
        .scaleEffect(getScaleAmount())
        .rotationEffect(Angle(degrees: getRotateAmount()))
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation(.easeInOut(duration: 0.2)) {
                        offset = value.translation
                    }
                }
                .onEnded { value in
                    withAnimation(.easeInOut(duration: 0.2)) {
                        offset = .zero
                    }
                }
        )
        
    }
    
    // 左右滑动
    func updateImageIndex(hasMoreIndex: Bool) {
        let nextIndex = hasMoreIndex ? imageIndex + 1 : imageIndex - 1
        imageIndex = min(max(0, nextIndex), userCard.photos.count - 1)
        
    }
    
    // 喜欢和不喜欢的标志
    func createUserCardLabel(title: String, degree: Double, color: Color) -> some View {
        Text(title)
            .tracking(3)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
            .foregroundStyle(color)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(color, lineWidth: 3)
            )
            .rotationEffect(.degrees(degree))
    }
    
    // 放大缩小
    func getScaleAmount() -> CGFloat{
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.7) * 0.3
    }
    
    // 旋转效果
    func getRotateAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        return Double(percentage * 10)
    }
    
    // 底部信息
    func createUserCardBottomInfo() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(userCard.name) . \(userCard.age)")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                HStack {
                    Text(userCard.zodiac)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(5)
                        .background(Color.white.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    Text(userCard.place)
                }
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 30))
                    .padding(8)
            }
        }
        .foregroundStyle(Color.white)
        .padding()
        .background(
            LinearGradient(colors: [.black.opacity(0.9), .clear], startPoint: .bottom, endPoint: .top)
        )
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

#Preview {
    UserCardView(userCard: UserCard(name: "Bruce", age: 18, place: "China", zodiac: "Cancer", photos: ["User1", "User2"]))
}
