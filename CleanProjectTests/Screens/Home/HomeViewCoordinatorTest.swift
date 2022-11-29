//
//  HomeViewCoordinatorTest.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//

import Foundation
import XCTest
@testable import CleanProject

class HomeViewCoordinatorTest: XCTestCase{
    var sut: HomeCoordinator!
    var sut: HomeViewControllerMock()
    
    override func setUp() {
        super.setUp()

        createSut()
    }

    override func tearDown() {
        super.tearDown()

        releaseSut()
    }

    func createSut() {
        sut = HomeCoordinator()
        
    }

    func releaseSut() {
        sut = nil
        
    }
    
    func testgoToDetails(){
        sut.goToDetails(data: TestConstants.planetsAPIMock, sender: UIViewController)
        
    }
}
