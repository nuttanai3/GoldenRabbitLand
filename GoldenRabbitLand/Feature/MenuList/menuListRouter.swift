//
//  menuListRouter.swift
//  GoldenRabbitLand
//
//  Created by Nuttanai on 24/11/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class menuListRouter: NSObject, menuListRoutingLogic, menuListDataPassing {
    weak var viewController: menuListViewController?
    var dataStore: menuListDataStore?
}
