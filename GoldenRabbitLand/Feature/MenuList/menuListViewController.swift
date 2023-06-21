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
        var config = UIContentUnavailableConfiguration.empty()
        config.image = UIImage(systemName: "star.fill")
        config.imageProperties.tintColor = .white
        config.background.backgroundColor = .gray
        config.text = "No Favorites"
        config.textProperties.color = .white
        config.secondaryText =
            "Your favorite translations will appear here."
        config.secondaryTextProperties.color = .white
        var retryButtonConfig = UIButton.Configuration.borderless()
        retryButtonConfig.image = R.image.fakeTaxi()
        config.button = retryButtonConfig
        // Define the reload button action
        config.buttonProperties.primaryAction = UIAction.init(handler: { _ in
            self.dismiss(animated: true)
        })
        contentUnavailableConfiguration = config
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


