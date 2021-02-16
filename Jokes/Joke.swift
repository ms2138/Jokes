//
//  Joke.swift
//  Jokes
//
//  Created by mani on 2021-02-09.
//

import Foundation

struct Joke: Codable, Identifiable {
    var id: String
    var text: String
    var status: Int
}

extension Joke {
    enum CodingKeys: String, CodingKey {
        case id
        case text = "joke"
        case status
    }
}
