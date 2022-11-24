//
//  menuListPresenter.swift
//  GoldenRabbitLand
//
//  Created by Nuttanai on 24/11/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class menuListPresenter {
    var viewController: menuListDisplayLogic?
    
    required init(viewController: menuListDisplayLogic? = nil) {
        self.viewController = viewController
    }
}

extension menuListPresenter: menuListPresentationLogic {
    
    func presentSomethingOnSuccess(response: menuList.Something.Response) {
        let viewModel = menuList.Something.ViewModel()
        viewController?.displaySomethingOnSuccess(viewModel: viewModel)
    }

    func presentSomethingOnError(errorMessage: String) {
        viewController?.displayErrorMessage(errorMessage: errorMessage)
    }
}
