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
    var allSemesters: [tempSemester]
    init() {
        cumulativeGPA = 0
        allSemesters = []
        nonRoundedCumulativeGPA = 0
    }
    
    // Need a label to display Overall GPA
    
    func calcCumulativeGPA(semesters: [tempSemester]) {
        
        if semesters.count == 1 {
            cumulativeGPA = semesters[0].gpa
        }
        else {
            var sumOfSemesterGPA: Double = 0
            // Adds each gpa value from semester GPA to the overall GPA sum,
            for semester in semesters {
                allSemesters.append(semester)
                sumOfSemesterGPA += semester.gpa
            }
            nonRoundedCumulativeGPA = sumOfSemesterGPA / Double(semesters.count)
            let rounded = (nonRoundedCumulativeGPA * 100).rounded() / 100
            cumulativeGPA = rounded
        }
    }
    
    func updateGPAFromCurrentData(currentSem: tempSemester) {
        // Iterate through table view, grab GPA, update it with cumulative GPA
        // The tempSemester itself should have a auto calculated GPA
        nonRoundedCumulativeGPA = (nonRoundedCumulativeGPA + currentSem.gpa) / (Double(allSemesters.count) + 1)
        let rounded = (nonRoundedCumulativeGPA * 100).rounded() / 100
        cumulativeGPA = rounded
    }
}
