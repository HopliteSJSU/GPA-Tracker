//
//  SemesterView.swift
//  GPA Tracker
//
//  Created by Mariia Surmenok on 3/5/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import UIKit

let defaultRect = CGRect(x: 30, y: 100, width: 350, height: 700)
let semesterName = UITextField(frame: CGRect(x: 20, y: 10, width: 300, height: 30))
let semesterGPA = UILabel(frame: CGRect(x: 20, y: 30, width: 300, height: 40))
let tableOfClasses = UITableView(frame: CGRect(x: 20, y: 70, width: 320, height: 400))
let newClassButton = UIButton(frame: CGRect(x: 20, y: 470, width: 320, height: 50))

class SemesterView: UIView {
    public override init(frame: CGRect = defaultRect) {
        super.init(frame: defaultRect)
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        
        semesterName.placeholder = "Title"

        semesterGPA.text = "GPA: --"
        semesterGPA.textAlignment = .left
        
        // TODO: Add header to the table
        tableOfClasses.numberOfRows(inSection: 3)
        
        newClassButton.setTitle("+ Add class", for: UIControl.State.normal)
        newClassButton.setTitleColor(.black, for: UIControl.State.normal)
        
        self.addSubview(semesterName)
        self.addSubview(semesterGPA)
        self.addSubview(tableOfClasses)
        self.addSubview(newClassButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
