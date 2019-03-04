//
//  GPA_TrackerTests.swift
//  GPA TrackerTests
//
//  Created by Tim Roesner on 2/6/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import XCTest
@testable import GPA_Tracker


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
        let course1: Course = Course(name: "CS 146", weight: 3, grade: "B", isIgnored: false)
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
        let course2: Course = Course(name: "CS 155", weight: 3, grade: "A-", isIgnored: true)
        XCTAssert(course2.grade != course1.grade)
        XCTAssert(course2.name != course1.name)
        XCTAssert(course2.weight == 3)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
