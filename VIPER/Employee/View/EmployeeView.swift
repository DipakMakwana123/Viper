//
//  EmployeeView.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 25/07/22.
//

import Foundation
import UIKit
import IHProgressHUD


/*
 
 1. Refrence of Presenter
 
 */


protocol EmployeeViewProtocol {
    
    var presenter: EmployeePresenterProtocol? {get set}
    func displayEmployee(employee: Employee)
    func showError(errorMessage: String)
}
// Concrete Implementation

class EmployeeViewController: UIViewController,EmployeeViewProtocol {
    
    var presenter: EmployeePresenterProtocol?
    
    var tableView: UITableView? = {
        let table = UITableView()
        table.separatorStyle = .singleLine
        table.registerCell(identifiers: [ListTableCell.identifier])
        return table
    }()
    
    
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp(view: self)
        configureViews()
        callAPI()
    }
    
    private func callAPI(){
        IHProgressHUD.show(withStatus: "Getting data from server...")
        presenter?.getEmployee()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationItem.title = "Employee"
    }
    
    private func configureViews(){
        configureTableView()
        
    }
    private func configureTableView(){
        guard let tableView = self.tableView else {return}
        tableView.configureViewFromTopMargin(superView: view,topMargin: 4)
        tableView.configure(dataSource: self,delegate: self)
    }
    func displayEmployee(employee: Employee) {
        DispatchQueue.main.async {
            self.employee = employee
            self.tableView?.restore()
            self.tableView?.reloadData()
        }
        hideLoader()
    }
    
    private func hideLoader(){
        DispatchQueue.global(qos: .default).async(execute: {
            IHProgressHUD.dismiss()
        })
    }
    
    func showError(errorMessage: String) {
        DispatchQueue.main.async {
            self.hideLoader()
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
        cell.selectionStyle = .none
        cell.empData = emp
        return cell
    }
}
extension EmployeeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let data = employee?.data, let emp = data[safe:indexPath.row] else {return }
        presenter?.goToEmployeeDetail(empData: emp, navigationViewController: self.navigationController)
    }
}
