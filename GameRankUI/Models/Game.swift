//
//  Game.swift
//  GameRankUI
//
//  Created by yongzhan on 2020/6/16.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import Foundation

struct Game: Identifiable, Decodable {
    var id: String
    var artistName: String
    var releaseDate: String
    var name: String
    var artworkUrl100: String
    var genres: [Genre]
    
    var genresText: String {
        genres.map{ $0.name }.joined(separator: ".")
    }
}

struct Genre: Decodable {
    var name: String
}


extension Game {
    static var stubbed: [Game] {
        let url = Bundle.main.url(forResource: "game_list", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let games = try! JSONDecoder().decode([Game].self, from: data)
        return games
    }
}

