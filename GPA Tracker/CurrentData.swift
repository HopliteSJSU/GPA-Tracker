//
//  CurrentData.swift
//  GPA Tracker
//
//  Created by Jason Li on 3/28/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import Foundation
import Disk

class CurrentData {
    private var currentSemesters: [tempSemester]
    // private var dataToStore = [DataStorage]() // Not needed as we just add currentSemesters instead
    // var data: DataStorage
    
    private init() {
        currentSemesters = []
        // data = DataStorage()
    }
    
    
    static let shared = CurrentData() // Lets other objects access to all of it's properties
    
    
    public func addSemester(semester: tempSemester) {
        //  data.currentSemesterGPA = semester.gpa
        //  data.courses = semester.classes
        //  dataToStore.append(data)
        currentSemesters.append(semester)
    }
    
    public func removeSemester(atIndex: Int) {
        currentSemesters.remove(at: atIndex)
        // data.allSemesters.remove(at: atIndex)
    }
    
    public func getOverall() -> Double {
        let overall = OverallGPA()
        overall.calcCumulativeGPA(semesters: currentSemesters)
        return overall.cumulativeGPA
    }
    
    public func getGPA(atIndex: Int) -> Double {
        return currentSemesters[atIndex].gpa
    }
    
    public func load() {
        // To load, use Disk.retrieve ...
        do {
            try Disk.retrieve("currentSemesters.json", from: .documents, as: [tempSemester].self)
        } catch let error as NSError {
            fatalError("""
                Domain: \(error.domain)
                Code: \(error.code)
                Description: \(error.localizedDescription)
                Failure Reason: \(error.localizedFailureReason ?? "")
                Suggestions: \(error.localizedRecoverySuggestion ?? "")
                """)
        }
    }
    // Will call on the AppDelegate on exit
    
    public func store() {
        // To use, use Disk.save ...
        
        do {
            try Disk.save(self.currentSemesters, to: .documents, as: "currentSemesters.json") // Attempts to save to document
        } catch let error as NSError {
            fatalError("""
                Domain: \(error.domain)
                Code: \(error.code)
                Description: \(error.localizedDescription)
                Failure Reason: \(error.localizedFailureReason ?? "")
                Suggestions: \(error.localizedRecoverySuggestion ?? "")
                """)
        }
    }
    
    public func clear() {
        currentSemesters.removeAll()
    }
}
