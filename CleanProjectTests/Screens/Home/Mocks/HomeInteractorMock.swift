//
//  HomeInteractorMock.swift
//  CleanProjectTests
//
//  Created by josepL on 28/11/22.
//

import Foundation
@testable import CleanProject

class HomeInteractorMock: HomeInteractorProtocol{
    
    var errorCalled = false
    var asktoServiceArrayCalled = false
    var showError = false
    
    func asktoServiceArray(urlRecived url: String?, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void) {
        
        asktoServiceArrayCalled = true
        if errorCalled{
            completion(.failure(TestConstants.errorTestMock))
            showError = true
        }else{
            //Objecte que ha de tornar
            completion(.success(TestConstants.planetsInfoSWMock))
            showError = false
        }
    }
}
