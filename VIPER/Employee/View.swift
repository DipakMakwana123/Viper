//
//  View.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 25/07/22.
//

import Foundation
import UIKit


/*
 
 1. Refrence of Presenter
 
 */


protocol EmployeeViewProtocol {
    
    var presenter: EmployeePresenterProtocol? {get set}
    
    func displayEmployee(employee:Employee)
    
    func showError(errorMessage:String)
    

}
// Concrete Implementation

class EmployeeViewController: UIViewController,EmployeeViewProtocol {
    
    var presenter: EmployeePresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView?
    
    var employee: Employee?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setUp(view: self)
        
        configureViews()
        presenter?.showEmployee()
        
    }
    
    private func configureViews(){
        configureTableView()
    }
    private func configureTableView(){
        guard let tableView = self.tableView else {return}
        tableView.dataSource = self
       // tableView.delegate = self
    }
    func displayEmployee(employee: Employee) {
        DispatchQueue.main.async {
            self.employee = employee
            
            self.tableView?.reloadData()
        }
    }
    
    func showError(errorMessage: String) {
        self.showAlert(title: "Error", msg: errorMessage)
        DispatchQueue.main.async {
            self.tableView?.setEmptyMessage(message)
        }
    }
    
    
}

extension EmployeeViewController: UITableViewDataSource {
    
}
