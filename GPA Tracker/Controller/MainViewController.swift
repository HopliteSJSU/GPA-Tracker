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

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var semesterView: UIView!
    var tableOfClasses: UITableView!
    
    private let courses = ["CS 147", "CS 149", "MATH 123", "FR 101"]
    let cellReuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        
        setupSemesterView()
        setupTableOfClasses(semester: semesterView)
        
        // Register the table view cell class and its reuse id
        self.tableOfClasses.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableOfClasses.delegate = self
        tableOfClasses.dataSource = self
        
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
    
    func setupTableOfClasses(semester: UIView) {
        tableOfClasses = TableView()
        semester.addSubview(tableOfClasses)
        tableOfClasses.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(semester).inset(UIEdgeInsets(top: 107, left: 16, bottom: 20, right: 8))
            /*make.left.equalTo(semester).offset(16)
            make.right.equalTo(semester).offset(-8)
            make.top.equalTo(semester).offset(107)
            make.bottom.equalTo(semester).offset(-20)*/
        }
    }
    
    func setupSemesterView() {
        semesterView = SemesterView()
        self.view.addSubview(semesterView)

        
        semesterView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 121, left: 19, bottom: 90, right: 19))
        }
    }


}

