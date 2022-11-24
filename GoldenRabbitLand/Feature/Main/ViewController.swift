//
//  ViewController.swift
//  GoldenRabbitLand
//
//  Created by Nuttanai on 24/11/2565 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backGroundView: MainBackGroundView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        backGroundView.playAnimation()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        backGroundView.stopAnimation()
    }
}

