//
//  PlanetsInfoSW.swift
//  CleanProject
//
//  Created by josepL on 28/11/22.
//

import Foundation
protocol PlanetsInfoSWProtocol{
    var count: Int { get }
    var next: String? {get}
    var previous: String? {get}
    var results: [PlanetsAPI] {get}
}
struct PlanetsInfoSW: PlanetsInfoSWProtocol, Codable{
    var count: Int
    var next: String?
    var previous: String?
    var results: [PlanetsAPI]
}

