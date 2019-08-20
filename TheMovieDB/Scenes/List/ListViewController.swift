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

    lazy var interactorTest: ListInteractorDelegate? = ListInteractor(presenterDelegate: self)
    var viewControllerState: ViewControllerState?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactorTest?.receiveViewController(viewController: self)
        interactorTest?.load()
        
    }
}

extension ListViewController: ListViewControllerDelegate {
    
    func receivePopularMovies(movies: [Movie.Popular]) {
        print(movies)
    }
    
    func receivePlayingNowMovies(movies: [Movie.NowPlaying]) {
        print(movies)
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
