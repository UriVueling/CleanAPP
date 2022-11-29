//
//  HomePresenterMock.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//

import Foundation
@testable import CleanProject

class HomePresenterMock: HomePresenterProtocol{
    var view: HomeViewProtocol?
    var urlToPass: String?
    var arrayLocal: [PlanetsAPIProtocol] = []
    var loadFromCache: Bool = false
    var firstCall: Bool = false
    var checkIfMoreURLMore = false

    
    var askForArrayInteractorWithURLCalled = false
    var countArrayCalled = false
    var getArrayCalled = false
    var checkIfMoreURLCalled = false
    
    func askForArrayInteractorWithURL() {
        askForArrayInteractorWithURLCalled = true
    }
    
    func countArray() -> Int {
        countArrayCalled = true
        return TestConstants.countArrayMock
    }
    
    func getArray() -> [PlanetsAPIProtocol] {
        getArrayCalled = true
        return TestConstants.arrayPlanetsMock
    }
    
    func checkIfMoreURL() -> Bool {
        checkIfMoreURLCalled = true
        var returned = false
        if checkIfMoreURLMore{
            returned = true
        }
        return returned
    }
}
