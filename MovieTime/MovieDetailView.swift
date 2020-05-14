//
//  MovieDetailView.swift
//  MovieTime
//
//  Created by Bhavika Patel on 4/20/20.
//  Copyright © 2020 PIX. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {

    @State var store = ApiList()

    init() {
        store.getDetalMovieList(movieEndpoint: "t") { (movie) in
            print(movie)
        }
    }
    
    var body: some View {

            Text("Movie")

    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
        
    }
}
