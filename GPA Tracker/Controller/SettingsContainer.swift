//
//  SettingsContainer.swift
//  GPA Tracker
//
//  Created by Jason Li on 4/30/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import Foundation
import UIKit

class SettingsContainer: UIViewController {
    var controller: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        let svc = SettingsViewController()
        let controller = UINavigationController(rootViewController: svc)
        //controller.navigationBar.topItem?.title = "MyGPA"
        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
        
    }
    /*
    func setupSettings() {
        let svc = SettingsViewController()
        let controller = UINavigationController(rootViewController: svc)
        controller.navigationBar.topItem?.title = "MyGPA"
        controller.navigationItem.rightBarButtonItem? = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTap))
        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
 */
    
    @objc func doneTap(_ sender: UIButton) {
        print("FINISHED")
        self.dismiss(animated: true, completion: nil)
    }
}
