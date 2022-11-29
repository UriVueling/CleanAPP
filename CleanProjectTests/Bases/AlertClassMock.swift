//
//  AlertMock.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//

import Foundation
@testable import CleanProject
import UIKit

class AlertClassMock: AlertClassProtocol{
    
    var callAlertCalled = false
    
    func callAlert(with titleAlert: String, messageAlert: String, onView: UIViewController){
        callAlertCalled = true
    }
}
