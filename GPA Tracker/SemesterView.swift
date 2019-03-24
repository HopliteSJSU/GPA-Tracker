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
let semesterGPAHeight: CGFloat = 22.0
let weightLabelWidth: CGFloat = 74.0
let gradeLabelWidth: CGFloat = 47.0
let tableHeaderHeight: CGFloat = 22.0
let addClassButtonHeight: CGFloat = 41.0

let tableHeaderFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
let header1Font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.semibold)
let headler2Font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)

var semesterTitle: UITextField!
var semesterGPA: UILabel!
var tableOfClasses: UITableView!
var headerView: UIView!
var classNameLabel: UILabel!
var weightLabel: UILabel!
var gradeLabel: UILabel!
var addClassButton: UIButton!


class SemesterView: UIView {
    public override init(frame: CGRect = CGRect.zero) {
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 12
        
        setupSemesterTitle()
        setupSemesterGPA()
        setupTable()
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
    
    func setupSemesterGPA() {
        semesterGPA = UILabel()
        semesterGPA.text = "GPA: --"
        semesterGPA.textAlignment = .left
        semesterGPA.font = headler2Font
        self.addSubview(semesterGPA)
        semesterGPA.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(semesterGPAHeight)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.top.equalTo(self).offset(54)
        }
    }
    
    func setupTable() {
        tableOfClasses = UITableView()
        setupTableHeader()
        
        tableOfClasses.numberOfRows(inSection: 6)
        
        
        // TODO: for newClassButton the plus sign "+" should be an image
        // Set styles for button 'Add class'
        
        addClassButton = UIButton()
        addClassButton.setTitle("+ Add class", for: UIControl.State.normal)
        addClassButton.setTitleColor(.black, for: UIControl.State.normal)
        addClassButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        addClassButton.titleLabel?.font = header1Font
        
        let buttonImage = UIImage(named: "add)

        tableOfClasses.tableFooterView = addClassButton
        
        tableOfClasses.addSubview(addClassButton)
        // = UIButton(frame: CGRect(x: 0, y: 300, width: 300, height: 65))
        addClassButton.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(addClassButtonHeight)
            make.width.equalTo(tableOfClasses)
        }
        
        self.addSubview(tableOfClasses)
        
        tableOfClasses.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-8)
            make.top.equalTo(self).offset(107)
            make.bottom.equalTo(self).offset(-20)
            
        }
    }
    
    func setupTableHeader() {
        headerView = UIView()
        
        classNameLabel = UILabel()
        classNameLabel.text = "Class name"
        classNameLabel.font = tableHeaderFont
        
        weightLabel = UILabel()
        weightLabel.text = "Weight"
        weightLabel.font = tableHeaderFont
        
        gradeLabel = UILabel()
        gradeLabel.text = "Grade"
        gradeLabel.font = tableHeaderFont
        
        headerView.addSubview(classNameLabel)
        headerView.addSubview(weightLabel)
        headerView.addSubview(gradeLabel)
        
        classNameLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(headerView)
            make.right.equalTo(headerView).offset(-(weightLabelWidth + gradeLabelWidth))
        }
        
        weightLabel.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(headerView).offset(-gradeLabelWidth)
            make.width.equalTo(weightLabelWidth)
        }
        
        gradeLabel.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(headerView)
            make.width.equalTo(gradeLabelWidth)
        }

        tableOfClasses.tableHeaderView = headerView
        headerView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(tableHeaderHeight)
            make.width.equalTo(tableOfClasses)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
