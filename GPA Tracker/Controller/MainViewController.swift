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
        print("size of the screen = ", self.view.frame.width)
        //print("Stack view = ", stackView.frame.width, stackView.frame.height)
        // Set scrollView content size manually
        let contentWidth = self.view.frame.width * CGFloat(semesters.count)
        scrollView.contentSize = CGSize(width: contentWidth, height: self.view.frame.height)
        print("Scroll view content size = ", scrollView.contentSize)
        var lastVisibleRect = CGRect()
        lastVisibleRect.size.height = self.view.frame.height
        lastVisibleRect.origin.y = 0.0
        lastVisibleRect.size.width = self.view.frame.width
        lastVisibleRect.origin.x = self.view.frame.width * CGFloat(semesters.count - 1)
        scrollView.scrollRectToVisible(lastVisibleRect, animated: true)
    }
    
    @objc func pageControlTapped(sender: UIPageControl) {
        print("Tapped")
    }
    
    @objc func addSemester() {
        print("Stack view width = ", stackView.frame.width)
        let semester = Semester()
        self.semesters.append(semester)
        print("New semester has been appended! Number of semesters %d", self.semesters.count)
        setupSemesterFromData(semester)
        pageControl.numberOfPages = semesters.count
        print("Scroll view bounds width = ", scrollView.bounds.width)
        print("Stack view = ", stackView.frame.width, stackView.frame.height)
        
        // Manually update content width. New width = old width + width of a new semester
        scrollView.contentSize = CGSize(width: CGFloat(scrollView.contentSize.width + self.view.frame.width), height: scrollView.contentSize.height)
        
        var lastVisibleRect = CGRect()
        lastVisibleRect.size.height = self.view.frame.height
        lastVisibleRect.origin.y = 0.0
        lastVisibleRect.size.width = self.view.frame.width
        lastVisibleRect.origin.x = self.view.frame.width * CGFloat(semesters.count - 1)
        scrollView.scrollRectToVisible(lastVisibleRect, animated: true)
        
        
        print("Stack view width = ", stackView.frame.width)
        print("Scroll view size = ", scrollView.contentSize)
        print("Scroll view offset = ", scrollView.contentOffset)
        //print("width of scrollView =", scrollView.frame.width)
        print("Last Visible Rect = ", lastVisibleRect)
        print(" ")
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
            //make.edges.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        scrollView.delegate = self as? UIScrollViewDelegate
        
        stackView = UIStackView()
        stackView.distribution = .equalSpacing
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { (make) -> Void in
            //make.edges.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
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
        
        wrapper.addSubview(semesterView)
        
        semesterView.snp.makeConstraints { (make) -> Void in
            //make.height.equalTo(scrollView)
            //make.width.equalTo(self.view).inset(20)
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 121, left: 19, bottom: 90, right: 19))
            
        }
        
        stackView.addArrangedSubview(wrapper)
        wrapper.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(self.view)
            make.width.equalTo(self.view)
        }
        print("Wrapper view size  = ", wrapper.frame.width, wrapper.frame.height)
        print("Stack view size after adding wrapper = ", stackView.frame.width, stackView.frame.height)
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

