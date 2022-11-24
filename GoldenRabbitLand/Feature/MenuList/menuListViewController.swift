//
//  menuListViewController.swift
//  GoldenRabbitLand
//
//  Created by Nuttanai on 24/11/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class menuListViewController: UIViewController {
    var interactor: menuListBusinessLogic?
    var router: (menuListRoutingLogic & menuListDataPassing)?

    // MARK: @IBOutlet

    // MARK: Data
    
    // MARK: View lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      configure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        doSomething()
    }

    private func setupView() {
        // set view something
    }
    
    // MARK: Do something
    func doSomething() {
        let request = menuList.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension menuListViewController : menuListDisplayLogic {
    func displaySomethingOnSuccess(viewModel: menuList.Something.ViewModel) {
        
    }

    func displayErrorMessage(errorMessage: String) {
        
    }
}

// MARK: Setup & Configuration
extension menuListViewController {
    private func configure() {
        menuListConfiguration.shared.configure(self)
    }
}
