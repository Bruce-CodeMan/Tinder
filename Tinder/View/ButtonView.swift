//
//  ButtonView.swift
//  Tinder
//
//  Created by mac on 2024/5/10.
//

import SwiftUI

struct ButtonView: View {
    var type: ButtonType
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(12)
                .modifier(ColorButton(type: type))
                .background(.black.opacity(0.4))
        }
        .buttonStyle(PressScaleButton())
    }
}

struct PressScaleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct ColorButton: ViewModifier {
    var type: ButtonType
    func body(content: Content) -> some View {
        switch type {
        case .back:
            content
                .foregroundStyle(Color.yellow)
        case .no:
            content
                .foregroundStyle(Color.white)
                .padding(.horizontal, 30)
        case .heart:
            content
                .foregroundStyle(Color.pink)
                .padding(.horizontal, 30)
        case .star:
            content
                .foregroundStyle(Color.blue)
        }
    }
}

#Preview {
    HStack{
        ForEach(ButtonType.allCases) { type in
            ButtonView(type: type)
                .frame(height: 40)
        }
    }
    
}
