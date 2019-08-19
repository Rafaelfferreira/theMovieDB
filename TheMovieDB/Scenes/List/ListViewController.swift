//
//  ListViewController.swift
//  TheMovieDB
//
//  Created by Rafael Ferreira on 15/08/19.
//  Copyright © 2019 Rafael Ferreira. All rights reserved.
//

import Foundation
import UIKit

//protocol ListViewControllerDelegate: class {
//
//    func receivePopularMovies() -> [Movie.Popular]
//
//    func receivePlayingNowMovies(movies: [Movie.NowPlaying])
//
//    func receiveMovieDetails(movie: Movie.Details)
//
//    func receiveViewControllerState(viewControllerState: ViewControllerState)
//
//}

class ListViewController: UITableViewController {

    var interactorTest = ListInteractor()
    var presenterTest = ListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactorTest.load()
        
    }
    
    
}
