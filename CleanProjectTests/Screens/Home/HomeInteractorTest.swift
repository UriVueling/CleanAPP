//
//  HomeInteractorTest.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//


import XCTest
@testable import CleanProject

class HomeInteractorTest: XCTestCase{
    var sut: HomeInteractor!
    var homeServiceMock: HomeServiceMock!
    
    override func setUp() {
        super.setUp()
        createSut()
        
    }
    
    override func tearDown() {
        super.tearDown()
        releaseSut()
        
    }
    
    func createSut() {
        homeServiceMock = HomeServiceMock()
        sut = HomeInteractor(service: homeServiceMock)
    }
    
    func releaseSut(){
        sut = nil
        homeServiceMock = nil
    }
    //MARK: TESTS ---------------
    func testAsktoServiceArray(){
        sut.asktoServiceArray(urlRecived: TestConstants.urlMock, completion:{
            result in})
        XCTAssertTrue(homeServiceMock.giveBackAPIServiceCalled, "The service should be call")
    }
}
