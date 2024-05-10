enum ButtonType: String, CaseIterable, Identifiable {
    var id: RawValue { rawValue }
    case back = "gobackward"
    case no = "xmark"
    case heart = "heart.fill"
    case star = "star.fill"
}
