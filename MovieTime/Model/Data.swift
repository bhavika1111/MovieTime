//
//  Data.swift
//  MovieTime
//
//  Created by Bhavika Patel on 4/16/20.
//  Copyright © 2020 PIX. All rights reserved.
//

import Foundation

struct SearchData: Codable {

    var Search: [MovieData]
}

struct MovieData: Codable, Identifiable, Hashable {
    let id = UUID()

    var Title: String
    var Year: String
    var Poster: String
    var `Type`: String
}

struct MovieDetailData: Codable {

    var Title: String
    var Year: String
    var Rated: String
    var Released: String
    var Runtime: String
    var Poster: String
    var `Type`: String
}

enum MovieEndpoint: String {

    case search = "s"
    case titleForSearch = "t"
}



class Api {

    func getAllMovieData(searchText: String, movieEndpoint: String, completion: @escaping ([MovieData]) -> ()) {
        
        // Get the url with the JSON format
        guard let url = URL(string: "http://www.omdbapi.com/?\(movieEndpoint)=\(searchText)&apikey=d0cb6890&") else {
               fatalError("URL is not found!")
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in

            guard let data = data else {
                return
            }
            // Parse the data
            let search = try? JSONDecoder().decode(SearchData.self, from: data)
            DispatchQueue.main.async {

                completion(search?.Search ?? [])
            }

        }.resume()

    }
}

class ApiList {

    func getDetalMovieList(movieEndpoint: String, completion: @escaping (MovieDetailData) -> ()) {

        // Get the url with the JSON format
        guard let url = URL(string: "http://www.omdbapi.com/?\(movieEndpoint)=Batman&apikey=d0cb6890&") else {
               fatalError("URL is not found!")
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in

            guard let data = data else {
                return
            }
            // Parse the data
            let search = try! JSONDecoder().decode(MovieDetailData.self, from: data)
            DispatchQueue.main.async {
                completion(search)
            }

        }.resume()

    }
}

