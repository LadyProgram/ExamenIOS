//
//  FilmResponse.swift
//  ExamenIOS
//
//  Created by Mañanas on 17/6/25.
//

import Foundation

struct FilmResponse : Codable {
    let Search: [Film]
}

struct Film : Codable {
    let imdbID: String
    let Title: String
    let Poster: String
    let Year: String
    let Plot: String
    let Runtime: String
    let Director: String
    let Genre: String
    let Country: String
}

