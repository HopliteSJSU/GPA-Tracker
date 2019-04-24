//
//  Semester.swift
//  GPA Tracker
//
//  Created by Jason Li on 3/26/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import Foundation

public class tempSemester: Codable {
    var name: String
    var gpa: Double
    var classes: [Course]
    private var dict = ["A+": 4.0,
                        "A": 4.0,
                        "A-": 3.7,
                        "B+": 3.3,
                        "B": 3.0,
                        "B-": 2.7,
                        "C+": 2.3,
                        "C": 2.0,
                        "C-": 1.7,
                        "D+": 1.3,
                        "D": 1.0,
                        "D-": 0.67,
                        "F": 0
    ]
    init() {
        name = ""
        gpa = 0.0
        classes = []
    }
    
    func addClass(theCourse: Course) {
        classes.append(theCourse)
    }
    
    func removeClass(theCourse: Course) {
        let indexOfClass: Int = classes.firstIndex{$0 === theCourse}!
        if indexOfClass != nil {
            classes.remove(at: indexOfClass)
        }
    }
    
    func getClasses() -> [Course] {
        return classes
    }
    
    func gpaCalc() -> Double {
        var totalCredits = 0.0
        var gradeAndCredits = 0.0
        // (grade * credits) / credits
        for course in classes {
            gradeAndCredits += course.weight * dict[course.grade]!
            totalCredits += course.weight
        }
        self.gpa = gradeAndCredits / totalCredits
        return self.gpa
    }
}
