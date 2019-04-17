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
    
    var addSemesterButton: UIButton!
    var scrollView: UIScrollView!
    var semesters: [Semester]!
    var semesterViews: [SemesterView]!
    var stackView: UIStackView!
    var pageControl: UIPageControl!
  
    
    
    fileprivate func setupSemesterFromData(_ semester: (Semester)) {
        let semesterView = setupSemesterView(semester : semester)
        stackView.addArrangedSubview(semesterView)
        semesterView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(scrollView)
            make.width.equalTo(self.view)
        }
        semesterViews.append(semesterView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        
        setupAddSemesterButton()
        addSemesterButton.addTarget(self, action: #selector(MainViewController.addSemester), for: UIControl.Event.touchUpInside)
        
        // DUMMY DATA
        self.semesters = [Semester]()
        
        let semester1 = Semester()
        semester1.name = "Spring 2019"
        semester1.gpa = 3.7
        self.semesters.append(semester1)
        
        let semester2 = Semester()
        semester2.name = "Summer 2019"
        self.semesters.append(semester2)
        
        let semester3 = Semester()
        semester3.name = "Fall 2019"
        self.semesters.append(semester3)
        
        // SCROLL VIEW and STACK VIEW
        scrollView = UIScrollView()
        scrollView.backgroundColor = bgColor
        self.view.addSubview(scrollView)
        scrollView.isPagingEnabled = true
        scrollView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(121)
            make.bottom.equalTo(self.view).offset(-90)
        }
        
        stackView = UIStackView()
        stackView.distribution = .equalSpacing
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
            
        }
      
        // Create SEMESTER VIEWS from data
        semesterViews = [SemesterView]()
        semesters.forEach { (semester) in
            setupSemesterFromData(semester)
        }
        
        // PAGE CONTROL
        pageControl = UIPageControl()
        self.view.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottom.equalTo(self.view).offset(-52)
        }
        pageControl.numberOfPages = semesters.count
        //pageControl
    }
    
    @objc func addSemester() {
        let semester = Semester()
        self.semesters.append(semester)
        print("New semester has been appended! Number of semesters %d", self.semesters.count)
        setupSemesterFromData(semester)
        pageControl.numberOfPages = semesters.count
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
    
    func setupSemesterView(semester : Semester) -> SemesterView {
        let semesterView = SemesterView(semester: semester, frame: CGRect.zero)
        /*self.view.addSubview(semesterView)
        semesterView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 121, left: 19, bottom: 90, right: 19))
        }*/
        return semesterView
    }


}

