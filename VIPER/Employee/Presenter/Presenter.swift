//
//  Presenter.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 25/07/22.
//

import Foundation

/*
 
 
 - Refrence of View
 - Refrence of Interactor
 - Refrence of Router
 - All View Display Logic
 - Format the data
 - Convert into Modal/ Entity
 
 
 */


protocol EmployeePresenterProtocol {
    var view: EmployeeViewProtocol? {get set}
    var interactor: EmployeeInteractorProtocol? {get set}
    var router: EmployeeRouterProtocol? {get set}
    
    func showEmployee()
    func formatEmployeeData(data: Data?)
    func showError(error:Error?)
    
}
// Concrete Implementation
class EmployeePresenter: EmployeePresenterProtocol {
   
    var view: EmployeeViewProtocol?
    
    var interactor: EmployeeInteractorProtocol?
    
    var router: EmployeeRouterProtocol?
    
    func formatEmployeeData(data: Data?) {
        guard let data = data , let employee = data.getModal(modal: Employee.self) else {return}
        view?.displayEmployee(employee: employee)
    }
    
    func showEmployee(){
        interactor?.getEmployee()
    }
    func showError(error:Error?){
        guard let err = error else {return}
        view?.showError(errorMessage: err.localizedDescription)
    }
    
}
