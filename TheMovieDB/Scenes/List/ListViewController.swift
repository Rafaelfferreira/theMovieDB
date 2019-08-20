//
//  ListViewController.swift
//  TheMovieDB
//
//  Created by Rafael Ferreira on 15/08/19.
//  Copyright © 2019 Rafael Ferreira. All rights reserved.
//

import Foundation
import UIKit

protocol ListViewControllerDelegate: class {

    func receivePopularMovies(movies: [Movie.Popular])

    func receivePlayingNowMovies(movies: [Movie.NowPlaying])

    func receiveMovieDetails(movie: Movie.Details)

    func receiveViewControllerState(viewControllerState: ViewControllerState)

}

class ListViewController: UITableViewController {
    
    
    let moviesCellID = "moviesCellID"
    
    lazy var interactorTest: ListInteractorDelegate? = ListInteractor(presenterDelegate: self)
    var viewControllerState: ViewControllerState?
    var popularMoviesList: [Movie.Popular] = []
    var playingNowMoviesList: [Movie.NowPlaying] = []
    var movieDetails: Movie.Details?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactorTest?.receiveViewController(viewController: self)
        interactorTest?.load()
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: moviesCellID)
        
        
        
    }
}

extension ListViewController: ListViewControllerDelegate {
    
    func receivePopularMovies(movies: [Movie.Popular]) {
        self.popularMoviesList = movies
    }
    
    func receivePlayingNowMovies(movies: [Movie.NowPlaying]) {
        self.playingNowMoviesList = movies
    }
    
    func receiveMovieDetails(movie: Movie.Details) {
        print(movie)
    }
    
    func receiveViewControllerState(viewControllerState: ViewControllerState) {
        self.viewControllerState = viewControllerState
    }
    
}

extension ListViewController: ListPresenterDelegate {
    func receiveRequestState(viewControllerState: ViewControllerState) {
        print(viewControllerState)
    }
    
    func receiveViewController(viewController: ListViewController) {
        print(viewController)
    }
}

