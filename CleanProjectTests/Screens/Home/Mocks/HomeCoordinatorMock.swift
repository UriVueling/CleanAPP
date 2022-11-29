//
//  HomeCoordinatorMock.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//

import Foundation
import UIKit
@testable import CleanProject

class HomeCoordinatorMock: HomeCoordinatorProtocol{
    
    var goToDetailsCalled = false
    
    func goToDetails(data: CleanProject.PlanetsAPIProtocol, sender: UIViewController) {
        goToDetailsCalled = true
    }
    
    
}
