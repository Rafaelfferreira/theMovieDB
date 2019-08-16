//
//  ListInteractor.swift
//  TheMovieDB
//
//  Created by Rafael Ferreira on 15/08/19.
//  Copyright © 2019 Rafael Ferreira. All rights reserved.
//

import Foundation
import UIKit

protocol ListBusinessLogic {
    func fetchPopularMovies()
}

// Receives information made by Worker and sends to Presenter
class ListInteractor: ListWorkerDelegate , ListPresenterDelegate{
    
    var popularMovies: [Movie.Popular]?
    var playingNowMovies: [Movie.NowPlaying]?
    var movieDetails: Movie.Details?
    
    
    func receiveMovieDetails(movie: Movie.Details) {
        movieDetails = movie
    }

    func receivePopularMovies(movies: [Movie.Popular]) {
        self.popularMovies = movies
    }

    func receivePlayingNowMovies(movies: [Movie.NowPlaying]) {
        playingNowMovies = movies
    }
    
    
    func getPopularMovies(didFinishGettingPopularMovies movies: [Movie.Popular]) {
        receivePopularMovies(movies: movies)
    }
    
    func getPlayingNowMovies(didFinishGettingPlayingNowMovies movies: [Movie.NowPlaying]) {
        receivePlayingNowMovies(movies: movies)
    }
    
    func getMovieDetails(didFinishGettingMovieDetails movie: Movie.Details) {
        receiveMovieDetails(movie: movie)
    }
    
    
    var listWorker: ListWorker = ListWorker()
    var listPresenter: ListPresenter = ListPresenter()
    
    func load() {
        listWorker.delegate = self
        listWorker.getPopularMoviesRequest() { (data, error) in
            // Receiving asynchronous information
            self.listPresenter.delegate = self
            self.listPresenter.getPopularMoviesFromInteractor(movies: self.popularMovies ?? [])
        }
        
        
    }
    
}
