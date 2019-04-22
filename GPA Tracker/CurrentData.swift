//
//  CurrentData.swift
//  GPA Tracker
//
//  Created by Jason Li on 3/28/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import Foundation

class CurrentData {
    private var currentSemesters: [tempSemester]
    
    private init() {
        currentSemesters = []
    }
    
    static let shared = CurrentData() // Lets other objects access to all of it's properties
    
    
    public func addSemester(semester: tempSemester) {
        currentSemesters.append(semester)
    }
    
    public func removeSemester(atIndex: Int) {
        currentSemesters.remove(at: atIndex)
    }
    
    public func getOverall() -> Double {
        let overall = OverallGPA()
        overall.calcCumulativeGPA(semesters: currentSemesters)
        return overall.cumulativeGPA
    }
    
    public func getGPA(atIndex: Int) -> Double {
        return currentSemesters[atIndex].gpa
    }
    
    /* from storage
     func read() {
     
     }
     
     func store() {
     
     }
     */
    
    public func clear() {
        currentSemesters.removeAll()
    }
}
