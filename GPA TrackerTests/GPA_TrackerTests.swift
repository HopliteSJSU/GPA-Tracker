//
//  GPA_TrackerTests.swift
//  GPA TrackerTests
//
//  Created by Tim Roesner on 2/6/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

@testable import GPA_Tracker
import XCTest


class GPA_TrackerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCourse() {
        let course1 = Course(name: "CS 146", weight: 3, grade: "B", isIgnored: false)
        XCTAssertEqual(course1.name, "CS 146")
        XCTAssertEqual(course1.grade, "B")
        XCTAssert(course1.weight == 3)
        XCTAssert(course1.isIgnored == false)
        course1.grade = "A+"
        XCTAssertEqual(course1.grade, "A+")
        course1.name = "MATH161A"
        XCTAssertEqual(course1.name, "MATH161A")
        course1.isIgnored = true
        course1.weight = 10
        let course2 = Course(name: "CS 155", weight: 3, grade: "A-", isIgnored: true)
        XCTAssert(course2.grade != course1.grade)
        XCTAssert(course2.name != course1.name)
        XCTAssert(course2.weight == 3)
    }
    
    func testSemester(){
//        var classes1 = [Course]()
//        let isFalse = false
//        let stringS = "Spring 2019"
        let course1 = Course(name: "CS 146", weight: 3, grade: "B", isIgnored: false)
//        classes1.append(course1)
//        let semester1 = Semester(name: stringS, gpa: 3.5, classes: classes1, isSemesterIgnored: isFalse)
//        //let semester2 = SemesterModel(
//        XCTAssertEqual(course1.name, "CS 146")
//        XCTAssertEqual(classes1, "CS 146")
//
        var Semester1 = [Course(name: "CS1", weight: 3.0, grade: "A-", isIgnored: false),
                     Course(name: "CS2", weight: 3.0, grade: "C-", isIgnored: false),
                     Course(name: "CS3", weight: 3.0, grade: "A-", isIgnored: false)
        ]
        Semester1.remove(at: 0)
        XCTAssertEqual(Semester1.count,2)
        XCTAssertEqual(Semester1[1].name,"CS3")
        
        
        var CourseArray:[Course] = Semester1
        var NewSemester: Semester = Semester(name: "Spring2019", gpa: 3.0, classes: CourseArray, isSemesterIgnored: false)
        NewSemester.addClass(newClass: course1)
        NewSemester.addClass(newClass: Course(name: "Class1", weight: 3, grade: "A", isIgnored: false))
        XCTAssertEqual(NewSemester.classes.count,4)
        XCTAssertEqual(NewSemester.classes[2].name,"CS 146")
        
        
        NewSemester.removeClass(theCourse: course1)
        XCTAssertEqual(NewSemester.classes[2].name,"Class1")
        XCTAssertEqual(NewSemester.deleteClass(theCourse: course1), 1)
        
        NewSemester.deleteClass(theCourse: NewSemester.classes[1])
        NewSemester.deleteClass(theCourse: NewSemester.classes[0])
        XCTAssertEqual(NewSemester.classes.count,0)
        
        CourseArray = Semester1
        NewSemester.addClass(newClass: course1)
        var newCourseArray:[Course] = NewSemester.getClasses()
        var testingCourse : Course = newCourseArray[0]
        XCTAssertEqual(newCourseArray[0].grade, testingCourse.grade)
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
