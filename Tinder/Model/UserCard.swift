//
//  UserCard.swift
//  Tinder
//
//  Created by mac on 2024/5/9.
//

import Foundation

struct UserCard: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let place: String
    let zodiac: String
    let photos: [String]
}
