//
//  OverallGPA.swift
//  GPA Tracker
//
//  Created by Jason Li on 3/26/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import Foundation

public class OverallGPA {
    // By default, always construct it as 0
    var nonRoundedCumulativeGPA: Double
    var cumulativeGPA: Double
    var cumulativeWeight: Double
    var overallGradePoints: Double
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
        cumulativeGPA = 0.0
        nonRoundedCumulativeGPA = 0.0
        cumulativeWeight = 0.0
        overallGradePoints = 0.0
    }
    
    // Need a label to display Overall GPA
    
    func calcCumulativeGPA(semesters: [tempSemester]) {
        if semesters.count == 1 {
            semesters[0].gpaCalc()
            cumulativeGPA = semesters[0].gpa
        }
        else {
            // Adds each gpa value from semester GPA to the overall GPA sum,
            for semester in semesters {
                semester.gpaCalc()
                overallGradePoints += semester.totalGradePoints
                cumulativeWeight += semester.totalWeight
            }
            nonRoundedCumulativeGPA = overallGradePoints / cumulativeWeight
            let rounded = (nonRoundedCumulativeGPA * 100).rounded() / 100
            cumulativeGPA = rounded
        }
    }
    
    func updateGPAFromCurrentData(currentSem: tempSemester) {
        // Iterate through table view, grab GPA, update it with cumulative GPA
        // The tempSemester itself should have a auto calculated GPA
        currentSem.gpaCalc()
        nonRoundedCumulativeGPA = (overallGradePoints + currentSem.totalGradePoints) / (cumulativeWeight + currentSem.totalWeight)
        let rounded = (nonRoundedCumulativeGPA * 100).rounded() / 100
        cumulativeGPA = rounded
    }
    
}
