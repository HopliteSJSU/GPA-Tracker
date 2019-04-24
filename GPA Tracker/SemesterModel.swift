//
//  SemesterModel.swift
//  GPA Tracker
//
//  Created by Teghbir Gill on 3/16/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import Foundation
import UIKit


public class SemesterModel{
    
    
    var isSemesterIgnored:Bool;
    
    
    var SemesterName:String="";
    var SemesterGPA:Double=0.0;
    var classes: [Course];
    
    init(name: String, gpa: Double, classes: [Course], isSemesterIgnored: Bool){
        self.SemesterName = name;
        self.SemesterGPA = gpa;
        self.classes = classes;
        self.isSemesterIgnored = isSemesterIgnored;
    }
    
    func addClass(newClass: Course){
        classes.append(newClass)
        
    }//end of addclass
    
    func deleteClass(theCourse: Course){
        
        //use indexOf()
        index(of classes: theCourse)->index
        classes.remove(at: index)
        

        //        for i in 0...classes.endIndex{
        //            //I think this might be wrong
        //            if theCourse === classes[i]{
        //                classes.remove(at: i)
        //                break
        //            }
        //            if i == classes.endIndex-1{
        //                break
        //            }
    }
    
    
    
    func getClasses() ->[Course]{
        return classes
    }
    
}

