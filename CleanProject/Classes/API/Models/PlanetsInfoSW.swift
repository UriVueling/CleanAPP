//
//  PlanetsInfoSW.swift
//  CleanProject
//
//  Created by josepL on 28/11/22.
//

import Foundation
protocol PlanetsInfoSWProtocol{
    var count: Int { get }
    var next: String? { get }
    var previous: String? { get }
    var results: [PlanetsAPIProtocol] { get}
}
struct PlanetsInfoSW: PlanetsInfoSWProtocol, Codable{
    var count: Int
    var next: String?
    var previous: String?
    var results: [PlanetsAPIProtocol] { castResults }
    
    private let castResults: [PlanetsAPI]
    
    enum CodingKeys: String, CodingKey{
        case count
        case next
        case previous
        case results
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        count = try values.decode(Int.self, forKey: .count)
        next = try values.decode(String.self, forKey: .next)
        previous = try values.decode(String.self, forKey: .previous)
        castResults = try values.decode([PlanetsAPI].self, forKey: .results)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(count, forKey: .count)
        try container.encode(next, forKey: .next)
        try container.encode(previous, forKey: .previous)
        try container.encode(castResults, forKey: .results)
    }
}

