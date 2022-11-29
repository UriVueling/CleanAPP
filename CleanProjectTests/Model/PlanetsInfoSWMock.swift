//
//  PlanetsInfoSWMock.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//

import Foundation

protocol PlanetsInfoSWProtocol{
    var count: Int { get }
    var next: String? { get }
    var previous: String? { get }
    var results: [PlanetsAPIProtocol] { get}
}
struct PlanetsInfoSWMock: PlanetsInfoSWProtocol{
    var count: Int
    var next: String?
    var previous: String?
    var results: [PlanetsAPIProtocol]
    
    init(count: Int, next: String? = nil, previous: String? = nil, results: [PlanetsAPIProtocol]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
