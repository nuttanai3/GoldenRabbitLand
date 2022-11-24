//
//  menuListConfiguration.swift
//  GoldenRabbitLand
//
//  Created by Nuttanai on 24/11/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class menuListConfiguration {
    static let shared: menuListConfiguration = menuListConfiguration()
    
    func configure(_ viewController: menuListViewController) {
        let interactor = menuListInteractor()
        let presenter = menuListPresenter()
        let router = menuListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
