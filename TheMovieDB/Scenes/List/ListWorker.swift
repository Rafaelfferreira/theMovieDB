//
//  ListWorker.swift
//  TheMovieDB
//
//  Created by Rafael Ferreira on 15/08/19.
//  Copyright © 2019 Rafael Ferreira. All rights reserved.
//

import Foundation

class ListWorker {
    
    func getPopularMoviesRequest(){
        let postData = NSData(data: "{}".data(using: String.Encoding.utf8)!)//NSData(data: "{}".data(usingEncoding: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/popular?page=1&language=en-US&api_key=77d63fcdb563d7f208a22cca549b5f3e")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let dataResponse = data, error == nil else{
                print(error)
                return
            }
            do {
                let returnAPI = try JSONDecoder().decode(APIReturn.self, from: dataResponse)
                print(returnAPI)
            } catch {
                print(error)
            }
        })
        
        dataTask.resume()
        
    }
    
    func preparePopularMovieInformation(httpResponse: HTTPURLResponse) {
        let popularMovie = movie.popular(title: "a" , rating: 1.1, image: "b", overview: "c")
    }

}
