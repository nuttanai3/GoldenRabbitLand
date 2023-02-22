//
//  ViewController.swift
//  GoldenRabbitLand
//
//  Created by Nuttanai on 24/11/2565 BE.
//

import UIKit
import Algorithms

class ViewController: UIViewController {

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
        doSomeThing()
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

extension ViewController {
    func doSomeThing() {
        //MARK: Chain
        let bigArray1 = Array(0...9_9)
        let bigArray2 = Array(0...9_999)
        let bigArray1Add2Old = bigArray1 + bigArray2
        print("bigArray1+bigArray2Old: ", bigArray1Add2Old.count)
        
        let bigArray1Add2 = chain(bigArray1, bigArray2)
        print("bigArray1+bigArray2: ", bigArray1Add2.count)
        
        let bigArray1Add2X = chain(bigArray1, bigArray2).lazy.map({$0 * 100}).filter({$0.isMultiple(of: 3)}).first(where: {$0 > 1_000})
        print("bigArray1Add2X", bigArray1Add2X ?? 0)
        
        //MARK: Chunked
        let results = [
            Student(name: "Taylor", grade: .A),
            Student(name: "Sophie", grade: .A),
            Student(name: "Bella", grade: .B),
            Student(name: "Rajesh", grade: .C),
            Student(name: "Tony", grade: .D),
            Student(name: "Theresa", grade: .D),
            Student(name: "Boris", grade: .F)
        ]
        
        let studentsByGrade = results.chunked(on: \.grade)
//        let studentsByGrade = results.chunked(on: {$0.grade})
        dump(studentsByGrade)
        
        let studentsByName = results.sorted { $0.name < $1.name }.chunked(on: \.name.first!)
        dump(studentsByName)
        
        let pairs = results.chunks(ofCount: 4)
        dump(pairs)
        dump(pairs.map({$0.map(\.name)}))
        
        //MARK: Uniqued
        let allNumbers = [3, 7, 8, 8, 7, 67, 8, 7, 13, 8, 3, 7, 31]
        let uniqueNumbers = allNumbers.uniqued().sorted()
        dump(uniqueNumbers)
        
        let destinations = [
            City(name: "Hamburg", country: "Germany"),
            City(name: "Kyoto", country: "Japan"),
            City(name: "Osaka", country: "Japan"),
            City(name: "Naples", country: "Italy"),
            City(name: "Florence", country: "Italy"),
        ]
        let selectedCities = destinations.uniqued(on: \.country)
        dump(selectedCities)
        
        //MARK: optionality
        let numbers1 = [10, nil, 20, nil, 30]
        let safeNumbers = numbers1.compacted()
        dump(safeNumbers)
        
        //MARK: nested all case
        let people = ["Sophie", "Charlotte", "Maddie", "Sennen"]
        let games = ["Mario Kart", "Boomerang Fu"]

        let allOptions = product(people, games)
        dump(allOptions)
        let allOptionsString = allOptions.map({"\($0.0) & \($0.1)"})
        dump(allOptionsString)
        
        //MARK: Sliding
        let numbers2 = (1...100).adjacentPairs()
        dump(numbers2.map({"\($0.0) & \($0.1)"}))
        
        let numbers3 = (1...100).windows(ofCount: 5)
        dump(numbers3.map({ListFormatter.localizedString(byJoining: $0.map({"\($0)"}))}))
        
        //MARK: Minimum and maximum
        let names = ["John", "Paul", "George", "Ringo"]

        if let (first, last) = names.minAndMax() {
            print(first)
            print(last)
        }
        
        let scores = [42, 4, 23, 8, 16, 15]
        let threeLowest = scores.min(count: 3)
        print(threeLowest)
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
