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

let header1Font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.semibold)
let headler2Font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)





class SemesterView: UIView, UITableViewDelegate, UITableViewDataSource {
    var semesterTitle: UITextField!
    var semesterGPA: UILabel!
    var tableOfClasses: UITableView!
    
    private var courses = ["CS 147", "CS 149", "MATH 123", "FR 101"]
    let cellReuseIdentifier = "cell"
    
    
    
    public override init(frame: CGRect = CGRect.zero) {
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 12
        
        setupSemesterTitle()
        setupSemesterGPA()
        setupTableOfClasses()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = tableOfClasses.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        // set the text from the data model
        cell.textLabel?.text = courses[indexPath.row]
        cell.textLabel?.font = header1Font
        return cell
    }
    
    func setupTableOfClasses() {
        tableOfClasses = TableView()
        self.addSubview(tableOfClasses)
        tableOfClasses.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 107, left: 16, bottom: 20, right: 8))
            /*make.left.equalTo(semester).offset(16)
             make.right.equalTo(semester).offset(-8)
             make.top.equalTo(semester).offset(107)
             make.bottom.equalTo(semester).offset(-20)*/
        }
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
