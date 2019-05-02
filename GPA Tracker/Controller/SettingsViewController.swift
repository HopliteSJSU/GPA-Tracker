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
    
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTap))
    var navBar: UINavigationBar!
    var navBarController: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.contentInset = UIEdgeInsets(top: 44,left: 0,bottom: 0,right: 0);
        // Make the tableview under the navigation bar
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
        navBarController = UINavigationController(rootViewController: SettingsViewController())
        // setupDoneButton()
        navBarConfig()
        print(CurrentData.shared.getOverall())
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
    }

    private func clearData (_ sender: Row) {
        // Clearing all data
        CurrentData.shared.clear()
        print("Clear Data")
    }
    
    private func gradePoints (_ sender: Row) {
        // Sets the grade points user specify
        print("GPA")
    }
    
    private func yourData (_ sender: Row) {
        // MyGPA and your data lorem ipsem?
        print("YourData")
    }
    
    private func privacy (_ sender: Row) {
        // Privacy
        print("Privacy")
    }
    
    private func acknowledge (_ sender: Row) {
        // Acknowledgements
        print("Acknowledgements")
    }
    
    private func support (_ sender: Row) {
        // Support
        print("Support")
    }
    
    @objc func doneTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func setupNavBar() {
      //  navBar = UINavigationBar(frame: CGRect(x: 0, y: 25, width: 100, height: 100))
        // navBar.isTranslucent = false
       //  view.addSubview(navBar)
    }
   // public func setupDoneButton() {
   //     doneButton = UIButton(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
  //      doneButton.setImage(UIImage(named: "settingsButton"), for: .normal)
    //    view.addSubview(doneButton)
    //}
    
    public func navBarConfig() {
        navigationItem.title = "MyGPA"
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    
    
    
    
    

}
