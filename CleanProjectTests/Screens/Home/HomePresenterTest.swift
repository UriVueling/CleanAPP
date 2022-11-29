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
        sut.arrayLocal = TestConstants.arrayPlanetsMock
        let count = sut.countArray()
        XCTAssertTrue(count > 0)
//        XCTAssertEqual(count, TestConstants.arrayPlanets.count)
        
    }
    
    
    func testLoadCacheNShow() {
        let storageMock = StorageManagerMock()
        storageMock.getObjectsSetError = true
        _ = storageMock.getObjects(name: "File.json")
        XCTAssertTrue(storageMock.getObjectsError, "Function should be calles")
        //XCTAssertEqual(result, TestConstants.arrayPlanetsMock)
        
        
    
//        loadFromCache = true
//        arrayLocal = StorageManager().getObjects(name: "planets.json") as! [PlanetsAPI]
//        view?.loadData()
//        view?.showAlert(tittle: "Error en la API", messageAlert: "No estamos recibiendo la info, cargando de cache")
    }
    func testLoadCacheNShowError() {
        let storageMock = StorageManagerMock()
        storageMock.getObjectsSetError = false
        _ = storageMock.getObjects(name: "File.json")
        XCTAssertFalse(storageMock.getObjectsError, "Function shouldnt return noting")

    }
    func testSaveCache() {
        
        let storageMock = StorageManagerMock()
        storageMock.saveObjects(objectArray: TestConstants.arrayPlanetsMock, name: "File.json")
        XCTAssertTrue(storageMock.saveObjectsCalled)
        //StorageManager().saveObjects(objectArray: arrayLocal, name: "planets.json")
    }
    func testCheckIfMoreURL(){
        sut.askForArrayInteractorWithURL()
        let response = sut.checkIfMoreURL()
        
        XCTAssertFalse(response, "Should response false because its nill")
//        if urlToPass != nil {
//            return true
//
//        } else {
//            return false
//        }
    }

    func testGetArray(){
        sut.askForArrayInteractorWithURL()
        viewMock.getArray()//Cridem a la funcio del view
        XCTAssertTrue(viewMock.getArrayCalled)
        
    }
}
