//
//  ListModels.swift
//  TheMovieDB
//
//  Created by Rafael Ferreira on 15/08/19.
//  Copyright © 2019 Rafael Ferreira. All rights reserved.
//

import Foundation

enum movie {
    struct nowPlaying {
        var title: String
        var rating: Double
        var image: String
    }
    
    struct popular{
        var title: String
        var rating: Double
        var image: String
        var overview: String
    }
    
    struct details {
        var title: String
        var rating: Double
        var image: String
        var overview: String
        var genres: String
    }
}
