//
//  NerworkManager.swift
//  Lesson9_HW
//
//  Created by Иван on 05.07.2022.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init(){ }
    
    func reguestTrendingPerson(completion: @escaping(([Actor]) -> ())){
        let url = "https://api.themoviedb.org/3/person/popular?api_key=99709c91f79d11764afb7ab67218f012"
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(Json4Swift_Base.self, from: responce.data!) {
                let actors = data.results ?? []
                completion(actors)
            }
        }
    }

    func reguestTrendingMovies(completion: @escaping(([Movie]) -> ())){
        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=99709c91f79d11764afb7ab67218f012"
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(JSONResponce.self, from: responce.data!) {
                let movies = data.results ?? []
                completion(movies)
            }
        }
    }
    
    func reguestTrendingSerials(completion: @escaping(([Movie]) -> ())){
        let url = "https://api.themoviedb.org/3/trending/tv/week?api_key=99709c91f79d11764afb7ab67218f012"
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(JSONResponce.self, from: responce.data!) {
                let movies = data.results ?? []
                completion(movies)
            }
        }
    }
}
