//
//  ListWorker.swift
//  TheMovieDB
//
//  Created by Rafael Ferreira on 15/08/19.
//  Copyright © 2019 Rafael Ferreira. All rights reserved.
//

import Foundation


protocol ListWorkerDelegate: class {
    func getPopularMovies(didFinishGettingPopularMovies movies: [Movie.Popular])
    
    func getPlayingNowMovies(didFinishGettingPlayingNowMovies movies: [Movie.NowPlaying])
    
    func getMovieDetails(didFinishGettingMovieDetails movie: Movie.Details)
}


// Makes the API Request, puts the information on the Model template and sends back to the Interactor
class ListWorker {
    
    var popularMovieList: [Movie.Popular] = []
    var playingNowMovieList: [Movie.NowPlaying] = []
    
    typealias finishedGettingPopularMovies = (_ data: [Movie.Popular]?, _ error: Error?) -> Void
    typealias finishedGettingPlayingNowMovies = (_ data: [Movie.NowPlaying]?, _ error: Error?) -> Void
    
    weak var delegate: ListWorkerDelegate?
    weak var interactorDelegate: ListInteractorDelegate?
    
    func getPopularMoviesRequest(completion: @escaping finishedGettingPopularMovies){
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?page=1&language=en-US&api_key=77d63fcdb563d7f208a22cca549b5f3e")!)
        
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            guard let dataResponse = data, error == nil else{
                print(error?.localizedDescription ?? "")
                return
            }
            do {
                let returnAPI = try JSONDecoder().decode(APIReturn.self, from: dataResponse)
               
                self.preparePopularMovieInformation(apiReturn: returnAPI)
                completion(self.popularMovieList, nil)
                
            } catch {
                print(error)
            }
        })
        
        dataTask.resume()
        
    }
    
    func getPlayingNowRequest(completion: @escaping finishedGettingPlayingNowMovies) {
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=77d63fcdb563d7f208a22cca549b5f3e&language=en-US&page=1")!)
        
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            do {
                let returnAPI = try JSONDecoder().decode(APIReturn.self, from: dataResponse)
                
                self.preparePlayingNowMovieInformation(apiReturn: returnAPI)
                completion(self.playingNowMovieList, nil)
                
            } catch {
                print(error.localizedDescription ?? "")
            }
        })
        
        dataTask.resume()
    }
    
    
    func getMovieImage(movieID: Int) {
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/images?api_key=77d63fcdb563d7f208a22cca549b5f3e&language=en-US")!)
        
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            guard let dataResponse = data, error == nil else{
                print(error)
                return
            }
            do {
                let returnAPI = try JSONDecoder().decode(APIReturn.self, from: dataResponse)
                
                self.preparePopularMovieInformation(apiReturn: returnAPI)
                
            } catch {
                print(error)
            }
        })
        
        dataTask.resume()
    }
    
    
    
    // Inserts information on Popular Movie model
    func preparePopularMovieInformation(apiReturn: APIReturn) {
        
        for movie in apiReturn.results {
            
            let movieTitle = movie.title
            let movieRating = movie.voteAverage
            let movieImage = movie.posterPath
            let movieOverview = movie.overview
            let movieGenres = movie.genreIDS
            
            let popularMovie = Movie.Popular(title: movieTitle!, rating: movieRating!, image: movieImage, overview: movieOverview, genres: movieGenres)
            
            popularMovieList.append(popularMovie)
        }
        
        
        // CHAMA O DELEGATE
        self.delegate?.getPopularMovies(didFinishGettingPopularMovies: popularMovieList)
    }
    
    func preparePlayingNowMovieInformation(apiReturn: APIReturn) {
        
        for movie in apiReturn.results {
            
            
            let movieTitle = movie.title
            let movieRating = movie.voteAverage
            let movieImage = movie.posterPath
            
            let nowPlayingMovie = Movie.NowPlaying(title: movieTitle!, rating: movieRating!, image: movieImage)
        
            playingNowMovieList.append(nowPlayingMovie)
        }
        
        self.delegate?.getPlayingNowMovies(didFinishGettingPlayingNowMovies: playingNowMovieList)
    }
    


}
