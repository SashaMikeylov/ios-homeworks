//
//  InfoModel.swift
//  Navigation
//
//  Created by Денис Кузьминов on 24.09.2023.
//

import Foundation

/*
 "name": "Tatooine",
     "rotation_period": "23",
     "orbital_period": "304",
     "diameter": "10465",
     "climate": "arid",
     "gravity": "1 standard",
     "terrain": "desert",
     "surface_water": "1",
     "population": "200000",
     "residents": [
 "films": [
         "https://swapi.dev/api/films/1/",
         "https://swapi.dev/api/films/3/",
         "https://swapi.dev/api/films/4/",
         "https://swapi.dev/api/films/5/",
         "https://swapi.dev/api/films/6/"
     ],
     "created": "2014-12-09T13:50:49.641000Z",
     "edited": "2014-12-20T20:58:18.411000Z",
     "url": "https://swapi.dev/api/planets/1/"
 */

struct Planet: Decodable {
    let name: String
    let rotationPeriod: String
    let orbitlaPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [URL]?
    let films: [URL]?
    let created: String
    let edited: String
    let url: URL?
    
    enum CodingKeys: String, CodingKey {
        case name, diameter, climate, gravity, terrain, population, residents, films, created, edited, url
        case rotationPeriod = "rotation_period"
        case orbitlaPeriod = "orbital_period"
        case surfaceWater = "surface_water"
    }
}


