//
//  Course.swift
//  GPA Tracker
//
//  Created by Jason Li on 3/4/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//
import Foundation

public class Course: Codable {
    var name: String // Course name
    var weight: Double // Course weight
    var grade: String // Course letter grade, A-, A, A+, etc
    var isIgnored: Bool // Ignore the grade temporarily or not consider it at all
    
    init(name: String, weight: Double, grade: String, isIgnored: Bool) { // Constructor
        self.name = name
        self.weight = weight
        self.grade = grade
        self.isIgnored = isIgnored
    }
}
