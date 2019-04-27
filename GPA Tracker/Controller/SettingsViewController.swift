//
//  SettingsViewController.swift
//  GPA Tracker
//
//  Created by Jason Li on 4/25/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import Foundation
import UIKit
import QuickTableViewController

class SettingsViewController: QuickTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableContents = [
            Section(title: "Settings", rows: [
                NavigationRow(text: "Grade Points", detailText: .value1(""), action: { [weak self] in self?.gradePoints($0) }),
                
                TapActionRow(text: "Erase all data", action: { [weak self] in self?.clearData($0) })
                ]),
            
            Section(title: "Legal", rows: [
                NavigationRow(text: "MyGPA and Your Data", detailText: .value1(""), action: { [weak self] in self?.yourData($0) }),
                NavigationRow(text: "Privacy Policy", detailText: .value1(""), action: { [weak self] in self?.privacy($0) }),
                NavigationRow(text: "Acknowledgements", detailText: .value1(""), action: { [weak self] in self?.acknowledge($0) }),
                ]),
            
            Section(title: "Miscellaneous", rows: [
                NavigationRow(text: "Support", detailText: .value1(""), action: { [weak self] in self?.support($0) }),
                ]),
        ]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
    }

    private func clearData (_ sender: Row) {
        // Clearing all data
    }
    
    private func gradePoints (_ sender: Row) {
        // Sets the grade points user specify
    }
    
    private func yourData (_ sender: Row) {
        // MyGPA and your data lorem ipsem?
    }
    
    private func privacy (_ sender: Row) {
        // Privacy
    }
    
    private func acknowledge (_ sender: Row) {
        // Acknowledgements
    }
    
    private func support (_ sender: Row) {
        // Support
    }
    
    
    
    
    
    
    

}
