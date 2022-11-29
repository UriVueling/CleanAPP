//
//  HomeViewControllerMock.swift
//  CleanProjectTests
//
//  Created by josepL on 28/11/22.
//

import Foundation
import UIKit
@testable import CleanProject

class HomeViewControllerMock: HomeViewProtocol{
    
    var loadDataCalled = false
    var getArrayCalled = false
    var showAlertCalled = false
    var loadingViewCalled = false
    
    func showAlert(tittle: String, messageAlert: String) {
        showAlertCalled = true
    }

    func loadData() {
        loadDataCalled = true
    }
    func getArray(){ //FROM PRESENTER
        getArrayCalled = true
    }
    func loadingView(_ state: CleanProject.LoadingState) {
        loadingViewCalled = true
    }
}
