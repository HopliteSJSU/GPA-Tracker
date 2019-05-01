//
//  SemesterModel.swift
//  GPA Tracker
//
//  Created by Teghbir Gill on 3/16/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import Foundation
import UIKit


public class Semester {
    
    
    var isSemesterIgnored:Bool;
    
    
    var SemesterName:String="";
    var SemesterGPA:Double=0.0;
    var classes = [Course]()
    
    init(name: String, gpa: Double, classes: [Course], isSemesterIgnored: Bool){
        self.SemesterName = name;
        self.SemesterGPA = gpa;
        self.classes = classes;
        self.isSemesterIgnored = isSemesterIgnored;
    }
    
    func addClass(newClass: Course){
        classes.append(newClass)
        
    }
    
    func removeClass(theCourse: Course){
        let indexOfClass: Int = classes.firstIndex{$0 === theCourse}!
        if indexOfClass != nil {
            classes.remove(at: indexOfClass)
        }
    }
    
     func deleteClass(theCourse: Course)->Int{
        
        var i:Int = -1
        for(index,theCourse) in classes.enumerated(){

            if(classes[index] === theCourse){
               i = index;
            }
        }

        if(i>=0){
        classes.remove(at: i)

        }else{
            return -1
        
        }
        return 1
    }
    
    
    
    func getClasses() ->[Course]{
        return classes
    }
    
}
