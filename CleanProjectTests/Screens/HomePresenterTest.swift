//
//  HomePresenterTest.swift
//  CleanProjectTests
//
//  Created by josepL on 28/11/22.
//

import Foundation
import XCTest
@testable import CleanProject

class HomePresenterTest: XCTestCase{
    var sut : HomePresenter!
    var interactorMock: HomeInteractorMock!
    var viewMock: HomeViewControllerMock!
    
    override func setUp() {
        super.setUp()
        createSut()
    }
    
    override func tearDown() {
        super.tearDown()
        releaseSut()
    }
    
    func createSut(){
        interactorMock = HomeInteractorMock()
        viewMock = HomeViewControllerMock()
        sut = HomePresenter(interactor: interactorMock)
    }
    
    func releaseSut(){
        sut = nil
        interactorMock = nil
        viewMock = nil
    }
    
    func testAskForArrayInteractorWithURLSucess(){
        interactorMock.errorCalled = false
        sut.askForArrayInteractorWithURL()
        XCTAssertFalse(interactorMock.showError)
        XCTAssertTrue(interactorMock.asktoServiceArrayCalled)
    }
    
    func testAskForArrayInteractorWithURLError(){
        interactorMock.errorCalled = true
        sut.askForArrayInteractorWithURL()
        XCTAssertTrue(interactorMock.showError)
        XCTAssertTrue(interactorMock.asktoServiceArrayCalled)
    }
    func testCountArray(){
        sut.arrayLocal = TestConstants.arrayPlanets
        let count = sut.countArray()
        XCTAssertTrue(count > 0)
//        XCTAssertEqual(count, TestConstants.arrayPlanets.count)
        
    }
    
    func testGetArray(){
        sut.askForArrayInteractorWithURL()
        viewMock.getArray()//Cridem a la funcio del view
        XCTAssertTrue(viewMock.getArrayCalled)
        
    }
}
