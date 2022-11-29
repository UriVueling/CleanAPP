//
//  HomeViewControllerTest.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//

import Foundation
import XCTest
@testable import CleanProject

class HomeViewControllerTest : XCTestCase {
    
    var sut: HomeViewController!
    var presenterMock: HomePresenterMock!
    var viewMock: HomeViewControllerMock!
    var coordinatorMock: HomeCoordinatorMock!
    var tableView: UITableView!
    
    override func setUp(){
        super.setUp()
        createSut()
        
    }
    override func tearDown() {
        super.tearDown()
        releaseSut()
    }
    
    func createSut(){
        presenterMock = HomePresenterMock()
        coordinatorMock = HomeCoordinatorMock()
        sut = HomeViewController(presenter: presenterMock)
        viewMock = HomeViewControllerMock()
        sut.coordinator = coordinatorMock
        _ = sut.view
        tableView = sut.table
    }
    func releaseSut(){
        sut = nil
        presenterMock = nil
        viewMock = nil
        tableView = nil
        //coodinatorMock = nil
    }
    func testViewDidLoad() {

        XCTAssertTrue(presenterMock.askForArrayInteractorWithURLCalled)
    }

    func testNumRowInSection() {
        let numTable = sut.tableView(tableView, numberOfRowsInSection: TestConstants.countTableMock)
        let numPresenter = presenterMock.countArray()
        XCTAssertEqual(numTable, numPresenter)


    }

    func testCellForRowAt() {

        let cell = sut.tableView(tableView!, cellForRowAt: TestConstants.testIndexPathMock) as! CustomCell
        
        XCTAssertEqual(cell.label?.text, TestConstants.planetsAPIMock.name)

    }
    func testDidSelectRowAtGetArray(){
        sut.tableView(tableView, didSelectRowAt: TestConstants.testIndexPathMock)
        //presenterMock.getArray()
        //?????
        XCTAssertTrue(presenterMock.getArrayCalled)
    }
    func testDidSelectRowAtCallCoordinator(){
        sut.tableView(tableView, didSelectRowAt: TestConstants.testIndexPathMock)
        
        coordinatorMock.goToDetails(data: TestConstants.planetsAPIMock, sender: sut)
        XCTAssertTrue(coordinatorMock.goToDetailsCalled)
        
    }
//    func testWillDisplay(){
//        sut.tableView(tableView, cell: CustomCell, indexPath: TestConstants.testIndexPathMock)
//
//    }
    func testShowAlert() {
        let alert = AlertClassMock()
        alert.callAlert(with: "", messageAlert: "", onView: sut)
        XCTAssertTrue(alert.callAlertCalled)
        
    }
}
