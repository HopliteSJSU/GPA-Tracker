//
//  ViewController.swift
//  GPA Tracker
//
//  Created by Tim Roesner on 2/6/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import UIKit
import SnapKit



let bgColor = UIColor(displayP3Red: 253 / 255, green: 219 / 255, blue: 93 / 255, alpha: 1.0)

class MainViewController: UIViewController {
    var semesterView: UIView!
    var overallGPA = OverallGPA()
    var semester1 = tempSemester()
    var semester2 = tempSemester()
    var semester3 = tempSemester()
    var semester4 = tempSemester()
    var totalSemesters = [tempSemester]()

    
    //var addClassButton: UIButton!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        semester1.classes = [Course(name: "CS1", weight: 3.0, grade: "A-", isIgnored: false),
                             Course(name: "CS2", weight: 3.0, grade: "C-", isIgnored: false),
                             Course(name: "CS3", weight: 3.0, grade: "A-", isIgnored: false)
                            ]
        semester2.classes = [Course(name: "CS1", weight: 4.0, grade: "A-", isIgnored: false),
                             Course(name: "CS2", weight: 4.0, grade: "B-", isIgnored: false),
                             Course(name: "CS3", weight: 2.0, grade: "B+", isIgnored: false)
                            ]
        
        semester3.classes = [Course(name: "CS1", weight: 3.0, grade: "B+", isIgnored: false),
                             Course(name: "CS2", weight: 3.0, grade: "C", isIgnored: false),
                             Course(name: "CS3", weight: 3.0, grade: "A", isIgnored: false)
                            ]
        semester4.classes = [Course(name: "CS1", weight: 3.0, grade: "B", isIgnored: false),
                             Course(name: "CS2", weight: 3.0, grade: "B", isIgnored: false),
                             Course(name: "CS3", weight: 3.0, grade: "D+", isIgnored: false),
                             Course(name: "CS4", weight: 3.0, grade: "A-", isIgnored: false)
                            ]
        
        overallGPA.calcCumulativeGPA(semesters: [semester1, semester2, semester3, semester4]) // This updates the GPA before displaying it, GPA here should be 3.01
        setupOverallGPALabel()
        setupSemesterView()
    }
    
    func setupSemesterView() {
        semesterView = SemesterView()
        self.view.addSubview(semesterView)
        semesterView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 121, left: 19, bottom: 90, right: 19))
        }
    }
    
    func setupOverallGPALabel() {
        let overallGPALabel = UILabel(frame: CGRect(x: 85, y: 49, width: 205, height: 40))
        overallGPALabel.font = UIFont(name: "SFProDisplay", size: 34)
        overallGPALabel.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.semibold)
        overallGPALabel.textAlignment = .center
        overallGPALabel.text = "Overall: " + String(overallGPA.cumulativeGPA) // Call it by overallGPA.calculateCumulativeGPA([tempSemester])
        overallGPALabel.textColor = .black
        self.view.addSubview(overallGPALabel)
        
    }

}

