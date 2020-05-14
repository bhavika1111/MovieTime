//
//  DataStore.swift
//  MovieTime
//
//  Created by Bhavika Patel on 4/16/20.
//  Copyright © 2020 PIX. All rights reserved.
//

import SwiftUI
import Combine


class DataStore: ObservableObject {

    @Published var movies:[MovieData] = []

    init(searchText: String) {
        getMovieList(searchText: searchText)
    }

    func getMovieList(searchText: String) {
        Api().getAllMovieData(searchText: searchText, movieEndpoint: MovieEndpoint.search.rawValue) { (movies) in
            self.movies = movies
        }
    }
}

struct DataStore_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
