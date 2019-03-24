//
//  SemesterView.swift
//  GPA Tracker
//
//  Created by Mariia Surmenok on 3/5/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import UIKit
import SnapKit

let semesterNameHeight: CGFloat = 34.0
let tableHeaderFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
let header1Font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.semibold)
let headler2Font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)

var semesterTitle: UITextField!
var semesterGPA = UILabel(frame: CGRect(x: 16, y: 54, width: 320, height: 22 ))
var tableOfClasses = UITableView(frame: CGRect(x: 16, y: 107, width: 320, height: 400))
var newClassButton = UIButton(frame: CGRect(x: 0, y: 300, width: 300, height: 65))
// header for the table
var headerView = UIView(frame: CGRect(x: 0, y: 50, width: 324, height: 22))
var classNameLabel = UILabel(frame: CGRect(x: 0, y: 5, width:150, height:22))
var weightLabel = UILabel(frame: CGRect(x: 192, y: 5, width:54, height:22))
var gradeLabel = UILabel(frame: CGRect(x: 266, y: 5, width:47, height:22))


class SemesterView: UIView {
    public override init(frame: CGRect = CGRect.zero) {
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 12
        self.clipsToBounds = true
        
        setupSemesterTitle()

        semesterGPA.text = "GPA: --"
        semesterGPA.textAlignment = .left
        semesterGPA.font = headler2Font
        
        // Header for the table
        classNameLabel.text = "Class name"
        classNameLabel.font = tableHeaderFont
        
        weightLabel.text = "Weight"
        weightLabel.font = tableHeaderFont
        
        gradeLabel.text = "Grade"
        gradeLabel.font = tableHeaderFont

        headerView.addSubview(classNameLabel)
        headerView.addSubview(weightLabel)
        headerView.addSubview(gradeLabel)
        
        tableOfClasses.numberOfRows(inSection: 6)
        tableOfClasses.tableHeaderView = headerView
        
        // TODO: for newClassButton the plus sign "+" should be an image
        // Set styles for button 'Add class'
        newClassButton.setTitle("+ Add class", for: UIControl.State.normal)
        newClassButton.setTitleColor(.black, for: UIControl.State.normal)
        newClassButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        newClassButton.titleLabel?.font = header1Font
        //tableOfClasses.insertSubview(newClassButton, at: 1)
        
        tableOfClasses.tableFooterView = newClassButton
        
        
        self.addSubview(semesterGPA)
        self.addSubview(tableOfClasses)
        

    }
    
    func setupSemesterTitle() {
        semesterTitle = UITextField()
        semesterTitle.placeholder = "Title"
        semesterTitle.font = header1Font
        self.addSubview(semesterTitle)
        semesterTitle.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(semesterNameHeight)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.top.equalTo(self).offset(12)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
