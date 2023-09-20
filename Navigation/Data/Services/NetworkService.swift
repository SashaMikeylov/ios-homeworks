//
//  NetworkService.swift
//  Navigation
//
//  Created by Денис Кузьминов on 17.09.2023.
//

import Foundation

enum AppConfiguration: String {
    case people = "https://swapi.dev/api/people/8"
    case starships = "https://swapi.dev/api/starships/3"
    case planets = "https://swapi.dev/api/planets/5"
}

struct NetworkService {
    static func requst(config: AppConfiguration){
        if let url = URL(string: config.rawValue){
           let task = URLSession.shared.dataTask(with: url) { data, reponse, error in
               if let error {
                   print("❌",error)
                   return
               }
               guard
                    let reponse = reponse as? HTTPURLResponse,
                        Array(200..<300).contains(reponse.statusCode)
               else{
                   return
               }
               print("⚠️", reponse)
               
               guard let data else {return}
               
               print("✅", String(bytes: data, encoding: .utf8))
            }
            task.resume()
        }
    }
}

