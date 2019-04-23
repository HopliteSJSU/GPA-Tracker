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
    var wrapperViews: [UIView]!
    var stackView: UIStackView!
    var pageControl: UIPageControl!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        
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
        
        // Setup Scroll View to show all semesters
        setupScrollView()
        
        // Setup button to add new semester
        setupAddSemesterButton()
        addSemesterButton.addTarget(self, action: #selector(MainViewController.addSemester), for: UIControl.Event.touchUpInside)
        
        // Setup page control (little dots for navigation)
        setupPageControl()
        pageControl.addTarget(self, action: #selector(pageControlTapped(sender:)), for: .valueChanged)
    }
    
    @objc func pageControlTapped(sender: UIPageControl) {
        print("Tapped")
    }
    
    @objc func addSemester() {
        let semester = Semester()
        self.semesters.append(semester)
        print("New semester has been appended! Number of semesters %d", self.semesters.count)
        setupSemesterFromData(semester)
        pageControl.numberOfPages = semesters.count
    }
    
    func setupPageControl() {
        pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        self.view.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottom.equalTo(self.view).offset(-52)
        }
        pageControl.numberOfPages = semesters.count
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.backgroundColor = bgColor
        self.view.addSubview(scrollView)
        scrollView.isPagingEnabled = true
        scrollView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
        
        stackView = UIStackView()
        stackView.distribution = .equalSpacing
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
            
        }
        
        // Create SEMESTER VIEWS from data
        semesterViews = [SemesterView]()
        wrapperViews = [UIView]()
        semesters.forEach { (semester) in
            setupSemesterFromData(semester)
        }
    }
    
    func setupSemesterFromData(_ semester: (Semester)) {
        let wrapper = UIView()
        
        let semesterView = setupSemesterView(semester : semester)
        stackView.addArrangedSubview(semesterView)
        
        stackView.addArrangedSubview(wrapper)
        wrapper.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(scrollView)
            make.width.equalTo(self.view)
        }
        wrapper.addSubview(semesterView)
        
        semesterView.snp.makeConstraints { (make) -> Void in
            //make.height.equalTo(scrollView)
            //make.width.equalTo(self.view).inset(20)
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 121, left: 19, bottom: 90, right: 19))
            
        }
        wrapperViews.append(wrapper)
        semesterViews.append(semesterView)
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
        return semesterView
    }
}

