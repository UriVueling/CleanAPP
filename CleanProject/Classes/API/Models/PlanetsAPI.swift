//
//  PlanetsAPI.swift
//  CleanProject
//
//  Created by josepL on 28/11/22.
//

import Foundation

protocol PlanetsAPIProtocol{
    
    var name: String { get }
    //var rotation_period: String { get }

}
struct PlanetsAPI: PlanetsAPIProtocol, Codable{
    var name: String
    //var rotation_period: String
    
    
    enum CodingKeys: String, CodingKey{
        case name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        
    }
}
//"name": "Tatooine",
//"rotation_period": "23",
//"orbital_period": "304",
//"diameter": "10465",
//"climate": "arid",
//"gravity": "1 standard",
//"terrain": "desert",
//"surface_water": "1",
//"population": "200000",
//"residents": [
//    "https://swapi.dev/api/people/1/",
//    "https://swapi.dev/api/people/2/",
//    "https://swapi.dev/api/people/4/",
//    "https://swapi.dev/api/people/6/",
//    "https://swapi.dev/api/people/7/",
//    "https://swapi.dev/api/people/8/",
//    "https://swapi.dev/api/people/9/",
//    "https://swapi.dev/api/people/11/",
//    "https://swapi.dev/api/people/43/",
//    "https://swapi.dev/api/people/62/"
//],
//"films": [
//    "https://swapi.dev/api/films/1/",
//    "https://swapi.dev/api/films/3/",
//    "https://swapi.dev/api/films/4/",
//    "https://swapi.dev/api/films/5/",
//    "https://swapi.dev/api/films/6/"
//],
//"created": "2014-12-09T13:50:49.641000Z",
//"edited": "2014-12-20T20:58:18.411000Z",
//"url": "https://swapi.dev/api/planets/1/"
//},
