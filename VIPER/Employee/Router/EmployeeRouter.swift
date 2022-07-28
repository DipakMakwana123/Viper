//
//  EmployeeRouter.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 25/07/22.
//

import Foundation
import UIKit

/*
 - Refrence to Presenter
 - Navigation
 - 
 
 */

typealias EntryPoint = UINavigationController & EmployeeViewProtocol

protocol EmployeeRouterProtocol {
    var entryPoint: EntryPoint? {get }
    var presenter: EmployeePresenterProtocol? {get set}
    func navigateToEmployeeDetail(empData:Datum?,navigationViewController:UINavigationController?)
}
// Concrete Implementation 
class EmployeeRouter: EmployeeRouterProtocol {
    
    var entryPoint: EntryPoint?
    var presenter: EmployeePresenterProtocol?

    func setUp(view:EmployeeViewProtocol){
        
        let empRouter = EmployeeRouter()
        
        var view : EmployeeViewProtocol =  view
        var presenter: EmployeePresenterProtocol = EmployeePresenter()
        var intractor: EmployeeInteractorProtocol = EmployeeInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = intractor
        presenter.router = empRouter
        intractor.presenter = presenter
    }
 
    
    func navigateToEmployeeDetail(empData:Datum?,navigationViewController:UINavigationController?){
        let employeeDetailVC = EmployeeDetailViewController()
        employeeDetailVC.empData = empData
        navigationViewController?.pushViewController(employeeDetailVC, animated: true)
    }
}
