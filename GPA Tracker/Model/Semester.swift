//
//  Semester.swift
//  GPA Tracker
//
//  Created by Mariia Surmenok on 4/13/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//
import Foundation

public class Semester {
    var name: String! // Semester name
    var gpa: Double! // Semester gpa
    var classes: [Course] // list of all classes taken this semester
    
    init() {
        self.classes = [Course]()
    }
}
