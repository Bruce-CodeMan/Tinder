//
//  CardContainerView.swift
//  Tinder
//
//  Created by mac on 2024/5/13.
//

import SwiftUI

struct CardContainerView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        ZStack(alignment: .bottom){
            ForEach(viewModel.displayingCard.reversed()) {card in
                UserCardView(userCard: card, swipeAction: viewModel.nextUserCard)
            }
            if viewModel.hasMoreCard {
                HStack {
                    ForEach(ButtonType.allCases) { type in
                        ButtonView(type: type)
                            .frame(height: 45)
                    }
                }
                .padding(.bottom, 15)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 50)
    }
}

#Preview {
    CardContainerView()
}
