//
//  ContentView.swift
//  MovieTime
//
//  Created by Bhavika Patel on 4/14/20.
//  Copyright © 2020 PIX. All rights reserved.
//

import SwiftUI
import URLImage

struct ContentView: View {

    @ObservedObject var store = DataStore(searchText: "Batman")
    @State private var searchTerm = ""
    
    var body: some View {

        NavigationView {

            VStack {

                SearchBar(text: self.$searchTerm, onTextChanged: searchMovies)

                List (store.movies.filter {
                    return self.searchTerm.isEmpty ? true :
                        $0.Title.lowercased().contains(self.searchTerm.lowercased())

                    //store.getMovieList(searchText: self.searchTerm)
                    //$0.Title.localizedCaseInsensitiveCompare(self.searchTerm)
                }, id: \.self) { movie in
                      NavigationLink(destination: MovieDetailView()) {
                        URLImage(URL(string: movie.Poster)!) { proxy in
                        proxy.image
                            .resizable()                     // Make image resizable
                            .aspectRatio(contentMode: .fill) // Fill the frame
                            .clipped()                       // Clip overlaping parts
                        }
                         .frame(minWidth: 150.0, maxWidth: 150.0, minHeight: 200.0, maxHeight: 200.0)
                        Spacer()
                        VStack {
                            Text(movie.Title)
                                .bold()
                                .padding(.bottom)
                            Text(movie.Year)
                            Text(movie.Type)

                        }.foregroundColor(.white).multilineTextAlignment(.center)

                    }.navigationBarTitle("Movies")
                    .padding()
                    .padding(.trailing, 10)
                    .background(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }

    func searchMovies(for searchText: String) {
//        if self.searchTerm == "" {
            self.store.getMovieList(searchText: self.searchTerm)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
