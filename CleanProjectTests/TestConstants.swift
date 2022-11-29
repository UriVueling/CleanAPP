//
//  TestConstants.swift
//  CleanProjectTests
//
//  Created by josepL on 28/11/22.
//

import Foundation
@testable import CleanProject

struct TestConstants{
    
    //TODO: CAMBIAR
    //Crear un mock de cada clase
    static let planetsAPIMock =  PlanetsAPIMock(name: "Terra")    //static let planetsAPIMock = PlanetsAPI((name: "Terra"))
    static let arrayPlanetsMock = [planetsAPIMock]
    static let planetsInfoSWMock = PlanetsInfoSWMock(count: 1, results: [planetsAPIMock])
    static let serviceAPIMock = ServiceAPIMock()
    static let countTableMock = 1
    static let countArrayMock = 1
    static let testIndexPathMock = IndexPath(row: 0, section: 0)


//    static let serviceAPI : ServiceAPIMock = ServiceAPIMock()
    
    //FIXES
    static let errorTestMock = CustomError(title: "Error Test", desc: "Errot Test", code: 0)
    static let urlMock = "FakeUrl"
    static let alertTittleMock = "Titulo Alerta"
    static let alertmessageMock = "Mensaje de la alerta"
    
    //static let timeOut: TimeInterval = 2.0
    //static let viewMock = Home
}
