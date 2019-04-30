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
    var settingsButton: UIButton!
    var overallGPA = OverallGPA()
    var semester1 = tempSemester()
    var semester2 = tempSemester()
    var totalSemesters = [tempSemester]()

    
    //var addClassButton: UIButton!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        semester1.gpa = 3.93
        semester2.gpa = 3.85
        overallGPA.calcCumulativeGPA(semesters: [semester1, semester2]) // This updates the GPA before displaying it, GPA here should be 3.89
        setupOverallGPALabel()
        setupSemesterView()
        setupSettingsButton()
        

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
    
    
    func setupSettingsButton() {
        settingsButton = UIButton(frame: CGRect.zero)
        settingsButton.showsTouchWhenHighlighted = true;
        settingsButton.setImage(UIImage(named: "settingsButton"), for: .normal)
        self.view.addSubview(settingsButton)
        settingsButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        settingsButton.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.view).offset(16)
            make.top.equalTo(self.view).offset(56)
        }

    }
    
    @objc func buttonClick(_ sender: UIButton) {
        let semesView: SettingsViewController = SettingsViewController()
        self.present(semesView, animated: true, completion: nil)
        print("Clicked")
    }


}

