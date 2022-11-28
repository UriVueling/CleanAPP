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
    //TODO: - Change LocationClass
    func setLabelOnScreen(objectPresenter: LocationClass)
    //TODO: - Change LocationClass
    func setImageOnScreen(objectPresenter: LocationClass)
}

class DetailsHomeView: UIViewController {
    var presenter: DetailsHomePresenterProtocol?

    
    public convenience init(presenter: DetailsHomePresenterProtocol) {
        //TODO: Change nom de nibname
        self.init(nibName: "AQUI EL NOM DE LA VISTA", bundle: nil)
        self.presenter = presenter
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView(){
        title = self.presenter?.getDataName()
        self.presenter?.viewDidLoadWasCalled()
        self.tabBarController?.tabBar.isHidden = true
    }
}

extension DetailsHomeView: DetailsHomeViewProtocol {
    //TODO: - Change LocationClass
    func setLabelOnScreen(objectPresenter: LocationClass) {
//        label.text = objectPresenter.name
    }
    //TODO: - Change LocationClass
    func setImageOnScreen(objectPresenter: LocationClass) {
//        DispatchQueue.global().async {
//            if let url = URL(string: objectPresenter.image)  {
//                let data = NSData(contentsOf: url)
//                DispatchQueue.main.async {
//                    self.image.image = UIImage(data: data! as Data)
//                }
//            }
//        }
    }
}
