//
//  ViewController.swift
//  GPA Tracker
//
//  Created by Tim Roesner on 2/6/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import UIKit
import SnapKit

var semesterView: UIView!

let bgColor = UIColor(displayP3Red: 253 / 255, green: 219 / 255, blue: 93 / 255, alpha: 1.0)

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        
        setupSemesterView()
    }
    
    func setupSemesterView() {
        semesterView = SemesterView()
        self.view.addSubview(semesterView)
        semesterView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 121, left: 19, bottom: 90, right: 19))
        }
    }


}

