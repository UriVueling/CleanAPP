//
//  HomeViewController.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Uri López.. All rights reserved.
//
import Foundation
import UIKit

protocol HomeViewProtocol {
    //func didTapOnButton(viewController: HomeViewController)
    func showAlert(tittle: String, messageAlert: String)
    func loadData()
}

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var presenter: HomePresenterProtocol?
    var coordinator: HomeCoordinatorProtocol?
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var table: UITableView!
    
    public convenience init(presenter: HomePresenterProtocol) {
        self.init(nibName: "HomeViewController", bundle: nil)
        self.presenter = presenter
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    func setUpView(){
        presenter?.askForArrayInteractorWithURL()
        //TODO: CHANGE NIB OF CELL
        table.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        table.dataSource = self
        table.delegate = self
        
        loading.isHidden = true
    }
}

extension HomeViewController: HomeViewProtocol {
    //MARK: TABLE CONFIG
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = presenter?.countArray() else { return 0 }
        return count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: CHANGE IDENTIFIER "RickViewCell" AND as? RickViewCell (CUSTOM CELL)
        if let cell = table.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell{
            guard let arrayFromPresenter = presenter?.getArray() else { return cell }
            cell.label.text = arrayFromPresenter[indexPath.row].name
            return cell
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
            guard let data = self.presenter?.getArray()[indexPath.row] else{
                return }
        
        //self.coordinator?.goToDetails(data: data, sender: self)
        
    }
    //MARK: FUNCTIONS
    func showAlert(tittle: String, messageAlert: String) {
        let pushAlert = AlertClass()
        DispatchQueue.main.async {
            pushAlert.callAlert(with: tittle, messageAlert: messageAlert, onView: self)
        }
        
    }
    
    func loadData() {
        DispatchQueue.main.async {
            self.table.reloadData()
        }
        
    }
}
