//
//  FilmProvider.swift
//  ExamenIOS
//
//  Created by Mañanas on 17/6/25.
//

import Foundation

class FilmProvider {
    
    static let API_KEY = "1e6219c6&s="
    
    static func findFilmByName(query: String) async -> [Film] {
        let url = URL(string: "https://www.omdbapi.com/?apikey=\(API_KEY)\(query)")
        
        guard let url = url else {
            print("Error building URL")
            return []
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(FilmResponse.self, from: data)
            
            return result.Search
        } catch {
            print(error)
            return []
        }
    }
    
    static func findFilmById(id: String) async -> Film? {
        let url = URL(string: "https://www.omdbapi.com/?apikey=1e6219c6&i=\(id)")
        
        guard let url = url else {
            print("Error building URL")
            return nil
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(Film.self, from: data)
            
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
