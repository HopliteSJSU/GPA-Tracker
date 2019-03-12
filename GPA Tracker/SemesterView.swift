//
//  SemesterView.swift
//  GPA Tracker
//
//  Created by Mariia Surmenok on 3/5/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import UIKit

let defaultRect = CGRect(x: 19, y: 121, width: 337, height: 601)
let semesterName = UITextField(frame: CGRect(x: 16, y: 12, width: 320, height: 34))
let semesterGPA = UILabel(frame: CGRect(x: 16, y: 54, width: 320, height: 22 ))
let tableOfClasses = UITableView(frame: CGRect(x: 16, y: 107, width: 320, height: 400))
let newClassButton = UIButton(frame: CGRect(x: 20, y: 300, width: 300, height: 65))

class SemesterView: UIView {
    public override init(frame: CGRect = defaultRect) {
        super.init(frame: defaultRect)
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        // TODO: Shadow should be lighter
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 12
        // TODO: Adjust the size and padding of elements, so they look nice on all screens
        // TODO: Adjust font styles
        
        semesterName.placeholder = "Title"
        semesterName.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.semibold)

        semesterGPA.text = "GPA: --"
        semesterGPA.textAlignment = .left
        semesterGPA.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        
        // Header to the table
        let headerView = UIView(frame: CGRect(x: 0, y: 50, width: 324, height: 22))
        let classNameLabel = UILabel(frame: CGRect(x: 0, y: 5, width:150, height:22))
        classNameLabel.text = "Class name"
        classNameLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        
        let weightLabel = UILabel(frame: CGRect(x: 192, y: 5, width:54, height:22))
        weightLabel.text = "Weight"
        weightLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        
        let gradeLabel = UILabel(frame: CGRect(x: 266, y: 5, width:47, height:22))
        gradeLabel.text = "Grade"
        gradeLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        
        headerView.addSubview(classNameLabel)
        headerView.addSubview(weightLabel)
        headerView.addSubview(gradeLabel)
        
        tableOfClasses.numberOfRows(inSection: 1)
        tableOfClasses.tableHeaderView = headerView
        
        // TODO: newClassButton should be in the footer of the table
        
        // Set styles for button 'Add class'
        newClassButton.setTitle("+ Add class", for: UIControl.State.normal)
        newClassButton.setTitleColor(.black, for: UIControl.State.normal)
        newClassButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        newClassButton.titleLabel?.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.semibold)
        
        //tableOfClasses.tableFooterView = newClassButton
        
        self.addSubview(semesterName)
        self.addSubview(semesterGPA)
        self.addSubview(tableOfClasses)
        self.addSubview(newClassButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
