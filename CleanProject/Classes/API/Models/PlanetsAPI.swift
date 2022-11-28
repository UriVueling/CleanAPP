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
}
