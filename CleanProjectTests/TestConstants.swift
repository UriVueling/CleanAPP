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
    static let planetsAPIMock =  PlanetsAPIMock(name: "Terra")
    //static let planetsAPIMock = PlanetsAPI((name: "Terra"))
//    static let arrayPlanets = [planetsAPIMock]
    static let planetsInfoSWMock = PlanetsInfoSWMock(count: 1, results: [planetsAPIMock])
//    static let serviceAPI : ServiceAPIMock = ServiceAPIMock()
    
    //FIXES
    static let errorTest = CustomError(title: "Error Test", desc: "Errot Test", code: 0)
    static let url = "FakeUrl"
    static let alertTittle = "Titulo Alerta"
    static let alertmessage = "Mensaje de la alerta"
    static let timeOut: TimeInterval = 2.0

}
