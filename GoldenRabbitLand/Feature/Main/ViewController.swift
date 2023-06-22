//
//  ViewController.swift
//  GoldenRabbitLand
//
//  Created by Nuttanai on 24/11/2565 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var footerLabel: UILabel!
    @IBOutlet weak var backGroundView: MainBackGroundView!
    @IBOutlet weak var logoImageView: UIImageView!
    var logoImages = [UIImage]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let image = UIImage(named: R.image.fakeTaxi.name) {
            logoImages.append(image)
        }
        if let image = UIImage(named: R.image.nutty.name) {
            logoImages.append(image)
        }
        if let image = UIImage(named: R.image.playGround.name) {
            logoImages.append(image)
        }
        titleLabel.traitOverrides.typesettingLanguage = Locale.Language(identifier: "th")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        backGroundView.playAnimation()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        backGroundView.stopAnimation()
    }
    
    @IBAction func menuListAction(_ sender: UIButton) {
        if let vc = R.storyboard.menuListStoryboard.menuListViewController() {
            present(vc, animated: true)
        }
    }
    
    @IBAction func changeImageAction(_ sender: UIButton) {
        logoImageView.image = logoImages[count % 3]
        count += 1
    }
}

