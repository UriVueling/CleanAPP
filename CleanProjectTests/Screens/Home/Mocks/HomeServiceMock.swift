//
//  HomeServiceMock.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//

import Foundation
@testable import CleanProject

class HomeServiceMock: HomeServiceProtocol{
    var giveBackAPIServiceCalled = false
    
    func giveBackAPIService() -> ServiceAPIProtocol {
        giveBackAPIServiceCalled = true
        
        return TestConstants.serviceAPIMock
    }
}
