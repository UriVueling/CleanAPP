//
//  DetailsHomeView.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Uri López.. All rights reserved.
//
import Foundation
import UIKit

protocol DetailsHomeViewProtocol {

}

class DetailsHomeView: UIViewController {
    var presenter: DetailsHomePresenterProtocol?
//    let strPlanetName = NSLocalizedString("planetName.key", comment: "")

    @IBOutlet weak var planetNameLabel: UILabel!
    
    public convenience init(presenter: DetailsHomePresenterProtocol) {
        //TODO: Change nom de nibname
        self.init(nibName: "DetailsHomeView", bundle: nil)
        self.presenter = presenter
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView(){
//        planetNameLabel.text = strPlanetName
        self.tabBarController?.tabBar.isHidden = true
    }
}

extension DetailsHomeView: DetailsHomeViewProtocol {

}
