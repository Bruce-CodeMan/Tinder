//
//  HomeScreen.swift
//  Tinder
//
//  Created by mac on 2024/5/9.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        CardContainerView(viewModel: viewModel)
    }
}

#Preview {
    HomeScreen()
}
