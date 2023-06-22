//
//  menuListViewController.swift
//  GoldenRabbitLand
//
//  Created by Nuttanai on 24/11/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import OSLog

class menuListViewController: UIViewController {
    var interactor: menuListBusinessLogic?
    var router: (menuListRoutingLogic & menuListDataPassing)?

    // MARK: @IBOutlet

    // MARK: Data
    let logger = Logger(subsystem: "subsystem23", category: "category2")
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
            var arr = [[String: Any]]()
            var dict = [String: Any]()
            dict["a"] = 0
            dict["b"] = ""
            arr.append(dict)
            self.logger.info("\(arr) \(dict)")
            self.contentUnavailableConfiguration = nil
        })
        contentUnavailableConfiguration = config
        doSomething()
        logger.notice("\(config)")
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        //between viewWillAppear to viewWillLayoutSubviews
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
        var arr = [structA]()
        var ao = structA(a: "11")
        arr.append(ao)
        logger.log(level: .error, "\(arr)")
        logger.trace("\(ao)")
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

struct structA: CustomStringConvertible {
    var description: String {
        return "structA(a: \(a), b: \(b))"
    }
    
    var a: String = "10"
    var b: Int = 9
}

