//
//  EmployeeDetailViewController.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 27/07/22.
//

import UIKit

protocol EmployeeDetailViewProtocol {
    var presenter: EmployeeDetailPresenterProtocol? {get set}
    func displayEmployeeDetails()
    func showError(message:String?)
}

class EmployeeDetailViewController: UIViewController {
    
    var presenter: EmployeeDetailPresenterProtocol?
    var empData:Datum?
    
    var tableView: UITableView? = {
        let table = UITableView()
        table.separatorStyle = .singleLine
        table.registerCell(identifiers: [EmployeeDetailTableCell.identifier])
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.router?.setUp()
        configureTableView()
    }
    private func configureTableView(){
        guard let tableView = self.tableView else {return}
        tableView.configureViewFromTopMargin(superView: view,topMargin: 4)
        tableView.configure(dataSource: self,delegate: nil)
    }
}

extension EmployeeDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeDetailTableCell.identifier, for: indexPath) as? EmployeeDetailTableCell, let empData = empData else {return UITableViewCell() }
        cell.empData = empData
        return cell
    }
}
extension EmployeeDetailViewController: EmployeeDetailViewProtocol {
    
    func displayEmployeeDetails() {
        
    }
    func showError(message:String?){
        
    }
    
}
