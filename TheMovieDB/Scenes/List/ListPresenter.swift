//
//  ListPresenter.swift
//  TheMovieDB
//
//  Created by Rafael Ferreira on 15/08/19.
//  Copyright © 2019 Rafael Ferreira. All rights reserved.
//

import Foundation


// Presenter receives information from Interactor
protocol ListPresenterDelegate: class {
    
    func receivePopularMovies(movies: [Movie.Popular])
    
    func receivePlayingNowMovies(movies: [Movie.NowPlaying])
    
    func receiveMovieDetails(movie: Movie.Details)
}



class ListPresenter {
    
    weak var delegate: ListPresenterDelegate?
    
    func getPopularMoviesFromInteractor(movies: [Movie.Popular]) {
        
    }
    
}
