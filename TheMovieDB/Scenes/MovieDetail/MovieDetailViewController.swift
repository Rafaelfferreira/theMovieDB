//
//  MovieDetailViewController.swift
//  TheMovieDB
//
//  Created by Rafael Ferreira on 15/08/19.
//  Copyright © 2019 Rafael Ferreira. All rights reserved.
//

import UIKit


class MovieDetailViewController : UIViewController {
    
    var presentedMovieTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(presentedMovieTitle)
    }
}
