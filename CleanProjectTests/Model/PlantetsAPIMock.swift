//
//  PlantetsAPIMock.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//

import Foundation
@testable import CleanProject

struct PlanetsAPIMock: PlanetsAPIProtocol{
    var name: String
    //var rotation_period: String
    
    
    init(name: String) {
        self.name = name
    }
    
}
