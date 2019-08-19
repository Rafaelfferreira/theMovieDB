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
    
    func receiveRequestState(viewControllerState: ViewControllerState)
}



class ListPresenter {
    
    weak var delegate: ListPresenterDelegate?
    var popularMoviesList: [Movie.Popular] = [] {
        didSet {
            updateViewControllerStatus()
            
        }
    }
    var requestState: ViewControllerState?
    //var listViewController: ListViewController = ListViewController()
    
    func updateViewControllerStatus(){
        if (popularMoviesList.count > 0) /*&& nowPlaying.count > 0*/{
            requestState = ViewControllerState.bothRequestsSucceeded
        } else if popularMoviesList.count > 0 {
            requestState = ViewControllerState.popularMoviesSucceeded
        } else {
            requestState = ViewControllerState.noRequestSucceeded
        }
    
    }
    
    func receivePopularMoviesFromInteractor(popularMovies: [Movie.Popular]) {
        popularMoviesList = popularMovies
        checkPopularMoviesReceivement(popularMovies: popularMovies)
    }
    
    func checkPopularMoviesReceivement(popularMovies: [Movie.Popular]) {
        if popularMovies.count > 0 {
            // Methods called if Presenter receives the popular movies correctly
        }
        else {
            // Methods called if Presenter receives the popular movies incorrectly
        }
    }
    
}
//
//extension ListPresenter: ListViewControllerDelegate {
//    func receivePopularMovies(movies: [Movie.Popular]) {
//        <#code#>
//    }
//
//    func receivePlayingNowMovies(movies: [Movie.NowPlaying]) {
//        print(movies)
//    }
//
//    func receiveMovieDetails(movie: Movie.Details) {
//        print(movie)
//    }
//
//    func receiveViewControllerState(viewControllerState: ViewControllerState) {
//        print(viewControllerState)
//    }
//
//
//}
