//
//  menuListProtocol.swift
//  GoldenRabbitLand
//
//  Created by Nuttanai on 24/11/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol menuListDisplayLogic {
    func displaySomethingOnSuccess(viewModel: menuList.Something.ViewModel)
    func displayErrorMessage(errorMessage: String)   
}

//MARK: Interactor
protocol menuListBusinessLogic {
    func doSomething(request: menuList.Something.Request)
}

//MARK: Presenter
protocol menuListPresentationLogic {
    func presentSomethingOnSuccess(response: menuList.Something.Response)
    func presentSomethingOnError(errorMessage: String)
}

//MARK: Worker
@objc protocol menuListWorkerProtocol {
    func doSomeWork()
}

//MARK: Routable
@objc protocol menuListRoutingLogic {

}

//MARK: DataStore
protocol menuListDataStore {

}

//MARK: DataPassing
protocol menuListDataPassing {
    var dataStore: menuListDataStore? { get }
}
