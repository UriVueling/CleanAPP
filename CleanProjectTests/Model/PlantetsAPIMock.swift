//
//  PlantetsAPIMock.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//

import Foundation

protocol PlanetsAPIProtocol{
    
    var name: String { get }
    //var rotation_period: String { get }

}
struct PlanetsAPIMock: PlanetsAPIProtocol{
    var name: String
    //var rotation_period: String
    
    
    init(name: String) {
        self.name = name
    }
    
}
