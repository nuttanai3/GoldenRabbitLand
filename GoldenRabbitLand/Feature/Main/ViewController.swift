//
//  ViewController.swift
//  GoldenRabbitLand
//
//  Created by Nuttanai on 24/11/2565 BE.
//

import UIKit
import Algorithms
import Instructions

class ViewController: UIViewController {

    @IBOutlet weak var backGroundView: MainBackGroundView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var changeLogoButton: UIButton!
    @IBOutlet weak var menuListButton: UIButton!
    
    var logoImages = [UIImage]()
    var count = 0
    
    var coachMarksController = CoachMarksController()
    weak var snapshotDelegate: CoachMarksControllerDelegate?
    
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
        coachMarksController.dataSource = self
        coachMarksController.delegate = self
        coachMarksController.overlay.backgroundColor =  UIColor(white: 0.0, alpha: 0.5)
        coachMarksController.overlay.isUserInteractionEnabled = true
        let skipView = CoachMarkSkipDefaultView()
        skipView.setTitle("Skip", for: .normal)
        coachMarksController.skipView = skipView
        doSomeThing()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        backGroundView.playAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        coachMarksController.stop(immediately: true)
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
        coachMarksController.flow.showNext(numberOfCoachMarksToSkip: 3)
        coachMarksController.start(in: .window(over: self))
    }
}

extension ViewController: CoachMarksControllerDelegate, CoachMarksControllerDataSource {
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: Instructions.CoachMark) -> (bodyView: (UIView & Instructions.CoachMarkBodyView), arrowView: (UIView & Instructions.CoachMarkArrowView)?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(
            withArrow: true,
            arrowOrientation: coachMark.arrowOrientation
        )
        switch index {
        case 0:
            coachViews.bodyView.hintLabel.text = "Hello! I'm a Coach Mark!"
            coachViews.bodyView.nextLabel.text = "0"
        case 1:
            coachViews.bodyView.hintLabel.text = "Hello! I'm a Coach Mark!"
            coachViews.bodyView.nextLabel.text = "1"
        default:
            coachViews.bodyView.hintLabel.text = "Hello! I'm a Coach Mark!"
            coachViews.bodyView.nextLabel.text = "2"
        }
        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
        switch index {
        case 0:
            return coachMarksController.helper.makeCoachMark(for: logoImageView)
        case 1:
            return coachMarksController.helper.makeCoachMark(for: changeLogoButton)
        default:
            return coachMarksController.helper.makeCoachMark(for: menuListButton)
        }
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 5
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, configureOrnamentsOfOverlay overlay: UIView) {
        snapshotDelegate?.coachMarksController(coachMarksController,
                                               configureOrnamentsOfOverlay: overlay)
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController,
                              willShow coachMark: inout CoachMark,
                              beforeChanging change: ConfigurationChange,
                              at index: Int) {
        snapshotDelegate?.coachMarksController(coachMarksController, willShow: &coachMark,
                                               beforeChanging: change,
                                               at: index)
    }

    func coachMarksController(_ coachMarksController: CoachMarksController,
                              didShow coachMark: CoachMark,
                              afterChanging change: ConfigurationChange,
                              at index: Int) {
        snapshotDelegate?.coachMarksController(coachMarksController, didShow: coachMark,
                                               afterChanging: change,
                                               at: index)
    }

    func coachMarksController(_ coachMarksController: CoachMarksController,
                              willHide coachMark: CoachMark,
                              at index: Int) {
        snapshotDelegate?.coachMarksController(coachMarksController, willHide: coachMark,
                                               at: index)
    }

    func coachMarksController(_ coachMarksController: CoachMarksController,
                              didHide coachMark: CoachMark,
                              at index: Int) {
        snapshotDelegate?.coachMarksController(coachMarksController, didHide: coachMark,
                                               at: index)
    }

    func coachMarksController(_ coachMarksController: CoachMarksController,
                              didEndShowingBySkipping skipped: Bool) {
        snapshotDelegate?.coachMarksController(coachMarksController,
                                               didEndShowingBySkipping: skipped)
    }

    func shouldHandleOverlayTap(in coachMarksController: CoachMarksController,
                                at index: Int) -> Bool {
        return true
    }
}

extension ViewController {
    func doSomeThing() {
//        //MARK: Chain
//        let bigArray1 = Array(0...9_9)
//        let bigArray2 = Array(0...9_999)
//        let bigArray1Add2Old = bigArray1 + bigArray2
//        print("bigArray1+bigArray2Old: ", bigArray1Add2Old.count)
//
//        let bigArray1Add2 = chain(bigArray1, bigArray2)
//        print("bigArray1+bigArray2: ", bigArray1Add2.count)
//
//        let bigArray1Add2X = chain(bigArray1, bigArray2).lazy.map({$0 * 100}).filter({$0.isMultiple(of: 3)}).first(where: {$0 > 1_000})
//        print("bigArray1Add2X", bigArray1Add2X ?? 0)
//
//        //MARK: Chunked
//        let results = [
//            Student(name: "Taylor", grade: .A),
//            Student(name: "Sophie", grade: .A),
//            Student(name: "Bella", grade: .B),
//            Student(name: "Rajesh", grade: .C),
//            Student(name: "Tony", grade: .D),
//            Student(name: "Theresa", grade: .D),
//            Student(name: "Boris", grade: .F)
//        ]
//
//        let studentsByGrade = results.chunked(on: \.grade)
////        let studentsByGrade = results.chunked(on: {$0.grade})
//        dump(studentsByGrade)
//
//        let studentsByName = results.sorted { $0.name < $1.name }.chunked(on: \.name.first!)
//        dump(studentsByName)
//
//        let pairs = results.chunks(ofCount: 4)
//        dump(pairs)
//        dump(pairs.map({$0.map(\.name)}))
//
//        //MARK: Uniqued
//        let allNumbers = [3, 7, 8, 8, 7, 67, 8, 7, 13, 8, 3, 7, 31]
//        let uniqueNumbers = allNumbers.uniqued().sorted()
//        dump(uniqueNumbers)
//
//        let destinations = [
//            City(name: "Hamburg", country: "Germany"),
//            City(name: "Kyoto", country: "Japan"),
//            City(name: "Osaka", country: "Japan"),
//            City(name: "Naples", country: "Italy"),
//            City(name: "Florence", country: "Italy"),
//        ]
//        let selectedCities = destinations.uniqued(on: \.country)
//        dump(selectedCities)
//
//        //MARK: optionality
//        let numbers1 = [10, nil, 20, nil, 30]
//        let safeNumbers = numbers1.compacted()
//        dump(safeNumbers)
//
//        //MARK: nested all case
//        let people = ["Sophie", "Charlotte", "Maddie", "Sennen"]
//        let games = ["Mario Kart", "Boomerang Fu"]
//
//        let allOptions = product(people, games)
//        dump(allOptions)
//        let allOptionsString = allOptions.map({"\($0.0) & \($0.1)"})
//        dump(allOptionsString)
//
//        //MARK: Sliding
//        let numbers2 = (1...100).adjacentPairs()
//        dump(numbers2.map({"\($0.0) & \($0.1)"}))
//
//        let numbers3 = (1...100).windows(ofCount: 5)
//        dump(numbers3.map({ListFormatter.localizedString(byJoining: $0.map({"\($0)"}))}))
//
//        //MARK: Minimum and maximum
//        let names = ["John", "Paul", "George", "Ringo"]
//
//        if let (first, last) = names.minAndMax() {
//            print(first)
//            print(last)
//        }
//
//        let scores = [42, 4, 23, 8, 16, 15]
//        let threeLowest = scores.min(count: 3)
//        print(threeLowest)
    }
}

struct Student {
    let name: String
    let grade: Grade
    
    enum Grade: String {
        case A = "A"
        case B = "B"
        case C = "C"
        case D = "D"
        case F = "F"
    }
}

struct City {
    let name: String
    let country: String
}
