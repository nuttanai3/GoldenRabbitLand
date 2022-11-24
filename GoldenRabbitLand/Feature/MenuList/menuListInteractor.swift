//
//  menuListInteractor.swift
//  GoldenRabbitLand
//
//  Created by Nuttanai on 24/11/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class menuListInteractor {
    var presenter: menuListPresentationLogic?
    var worker: menuListWorkerProtocol?

    required init(presenter: menuListPresentationLogic? = nil,
                  worker: menuListWorkerProtocol? = menuListWorker()) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension menuListInteractor: menuListDataStore, menuListBusinessLogic {
    func doSomething(request: menuList.Something.Request) {
        worker?.doSomeWork()
        
        let response = menuList.Something.Response()
        presenter?.presentSomethingOnSuccess(response: response)
    }
}
