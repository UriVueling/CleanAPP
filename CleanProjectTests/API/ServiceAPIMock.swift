//
//  ServiceAPIMock.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//

import Foundation
@testable import CleanProject

class ServiceAPIMock: ServiceAPIProtocol{
    
    var getSWArrayLocationResultCalled = false
    
    func getSWArrayLocationResult(url: String?, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void) {
        getSWArrayLocationResultCalled = true
    }
    
    
}
