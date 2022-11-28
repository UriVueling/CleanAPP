//
//  AlertClass.swift
//  CleanProject
//
//  Created by josepL on 28/11/22.
//

import Foundation
import UIKit

protocol AlertClassProtocol{
    func callAlert(with titleAlert: String, messageAlert: String, onView: UIViewController)
}
class AlertClass: AlertClassProtocol{
    func callAlert(with titleAlert: String, messageAlert: String, onView: UIViewController){
        let alert = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:{  action in
            print("tapped")
        }))
        onView.present(alert, animated: true)
    }
}
