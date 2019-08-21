//
//  ListModels.swift
//  TheMovieDB
//
//  Created by Rafael Ferreira on 15/08/19.
//  Copyright © 2019 Rafael Ferreira. All rights reserved.
//

import Foundation

enum Movie {
    struct NowPlaying {
        var title: String
        var rating: Double
        var image: String
    }
    
    struct Popular{
        var title: String
        var rating: Double
        var image: String
        var overview: String
        var genres: [Int]
    }
    
    struct Details {
        var title: String
        var rating: Double
        var image: String
        var overview: String
        var genres: String
    }
}

enum ViewControllerState {
    case bothRequestsSucceeded
    case popularMoviesSucceeded
    case noRequestSucceeded
}
