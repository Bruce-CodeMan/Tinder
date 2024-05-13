//
//  HomeViewModel.swift
//  Tinder
//
//  Created by mac on 2024/5/9.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var displayingCard: [UserCard]
    
    var hasMoreCard: Bool {
        !displayingCard.isEmpty
    }
    
    init() {
        displayingCard = [
            UserCard(name: "A", age: 18, place: "USA", zodiac: "Cancer", photos: ["User1", "User2"]),
            UserCard(name: "B", age: 19, place: "China", zodiac: "Aquarius", photos: ["User3", "User4"]),
            UserCard(name: "C", age: 20, place: "Japan", zodiac: "Pisces", photos: ["User2", "User5"]),
            UserCard(name: "D", age: 21, place: "China", zodiac: "Cancer", photos: ["User4", "User6"]),
            UserCard(name: "E", age: 22, place: "China", zodiac: "Cancer", photos: ["User6", "User2"]),
        ]
    }
    
    func nextUserCard() {
        if let _ = displayingCard.first {
            displayingCard.removeFirst()
        }
    }
}
