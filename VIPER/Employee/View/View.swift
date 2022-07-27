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
        setUp(view: self)
        
        configureViews()
        presenter?.showEmployee()
        
    }
    
    private func configureViews(){
        configureTableView()
    }
    private func configureTableView(){
        guard let tableView = self.tableView else {return}
         tableView.configure(dataSource: self,delegate: nil)
         tableView.separatorStyle = .singleLine
         tableView.registerCell(identifiers: [ListTableCell.identifier])
    }
    func displayEmployee(employee: Employee) {
        DispatchQueue.main.async {
            self.employee = employee
            self.tableView?.restore()
            self.tableView?.reloadData()
        }
    }
    
    func showError(errorMessage: String) {
        self.showAlert(title: "Error", msg: errorMessage)
        DispatchQueue.main.async {
            self.tableView?.setEmptyMessage(errorMessage)
        }
    }
    
    
}

extension EmployeeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employee?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: ListTableCell.identifier, for: indexPath) as? ListTableCell, let data = employee?.data, let emp = data[safe:indexPath.row] else {return UITableViewCell() }
        cell.lblTitle?.text = emp.name
        
        return cell
    }
    
    
}
