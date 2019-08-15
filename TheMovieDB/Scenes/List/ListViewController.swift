//
//  ListViewController.swift
//  TheMovieDB
//
//  Created by Rafael Ferreira on 15/08/19.
//  Copyright © 2019 Rafael Ferreira. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    var workertest = ListWorker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workertest.getPopularMoviesRequest()
    }
}
