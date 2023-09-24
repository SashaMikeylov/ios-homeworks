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
    
    static func request(config: AppConfiguration) {
        if let url = URL(string: config.rawValue) {
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
               
               print("✅", String(bytes: data, encoding: .utf8) ?? "")
            }
            task.resume()
        }
    }
    
    static func request(id: Int, completion: @escaping (String) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/" + String(id)) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    if let jsonObject = json as? [String: Any] {
                        guard let title = jsonObject["title"] as? String else {return}
                        completion(title)
                    }
                } catch {
                    print("Error ❌")
                }
            }
        }
        task.resume()
    }
    
    static func request(completion: @escaping ((Planet) -> Void)) {
        guard let url = URL(string: "https://swapi.dev/api/planets/1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let planet = try JSONDecoder().decode(Planet.self, from: data)
                    completion(planet)
                } catch {
                    print("Error ❌")
                }
            }
        }
        task.resume()
    }
    
    
}

