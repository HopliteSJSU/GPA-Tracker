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
    var addSemesterButton: UIButton!
    var semester: Semester!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        
        setupAddSemesterButton()
        addSemesterButton.addTarget(self, action: #selector(MainViewController.addSemester), for: UIControl.Event.touchUpInside)
        
        self.semester = Semester()
        //self.semester.name = "Spring 2019"
        //self.semester.gpa = 3.1
        setupSemesterView()
    }
    
    @objc func addSemester() {
        print("Button was touched!")
    }
    
    func setupAddSemesterButton() {
        addSemesterButton = UIButton(frame: CGRect.zero)
        let vectorImage = UIImage(named: "add")
        addSemesterButton.setImage(vectorImage, for: UIControl.State.normal)
        
        self.view.addSubview(addSemesterButton)
        addSemesterButton.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(self.view).offset(-16)
            make.top.equalTo(self.view).offset(56)
        }
    }
    
    func setupSemesterView() {
        semesterView = SemesterView(semester: self.semester, frame: CGRect.zero)
        self.view.addSubview(semesterView)
        semesterView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 121, left: 19, bottom: 90, right: 19))
        }
    }


}

