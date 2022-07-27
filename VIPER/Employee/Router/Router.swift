//
//  Router.swift
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

typealias EntryPoint = UIViewController & EmployeeViewProtocol
protocol EmployeeRouterProtocol {
    var entryPoint: EntryPoint? {get }
    var presenter: EmployeePresenterProtocol? {get set}
}
// Concrete Implementation 
class EmployeeRouter: EmployeeRouterProtocol {
    var entryPoint: EntryPoint?
    
    
    var presenter: EmployeePresenterProtocol?
    
    func setUp() -> EmployeeRouter{
        
        let router = EmployeeRouter()
        
        var view : EmployeeViewProtocol =  EmployeeViewController()
        var presenter: EmployeePresenterProtocol = EmployeePresenter()
        var intractor: EmployeeInteractorProtocol = EmployeeInteractor()
        
        view.presenter = presenter
         
        presenter.view = view
        presenter.interactor = intractor
        presenter.router = router
        intractor.presenter = presenter
        
        router.entryPoint = view as? EntryPoint
        return router
    }
}
