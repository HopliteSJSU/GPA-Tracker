//
//  TableView.swift
//  GPA Tracker
//
//  Created by Mariia Surmenok on 3/26/19.
//  Copyright © 2019 Tim Roesner. All rights reserved.
//

import UIKit
import SnapKit



let weightLabelWidth: CGFloat = 74.0
let gradeLabelWidth: CGFloat = 47.0
let tableHeaderHeight: CGFloat = 22.0
let addClassButtonHeight: CGFloat = 41.0

let tableHeaderFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)

class TableView :UITableView {
    var headerView: UIView!
    var classNameLabel: UILabel!
    var weightLabel: UILabel!
    var gradeLabel: UILabel!
    //var addClassButton: UIButton!
    
    override init(frame: CGRect = CGRect.zero, style: UITableView.Style = UITableView.Style.plain) {
        super.init(frame: CGRect.zero, style: UITableView.Style.plain)
        self.numberOfRows(inSection: 6)
        setupTableHeader()
        self.rowHeight = 65
        /*addClassButton = UIButton()
        addClassButton.setTitle("+ Add class", for: UIControl.State.normal)
        addClassButton.setTitleColor(.black, for: UIControl.State.normal)
        addClassButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        addClassButton.titleLabel?.font = header1Font
        self.tableFooterView = addClassButton
        addClassButton.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(addClassButtonHeight)
            make.width.equalTo(self)
        }*/

    }
    
    func setupTableHeader() {
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: tableHeaderHeight))
        
        classNameLabel = UILabel()
        classNameLabel.text = "Class name"
        classNameLabel.font = tableHeaderFont
        
        weightLabel = UILabel()
        weightLabel.text = "Weight"
        weightLabel.font = tableHeaderFont
        
        gradeLabel = UILabel()
        gradeLabel.text = "Grade"
        gradeLabel.font = tableHeaderFont
        
        headerView.addSubview(classNameLabel)
        headerView.addSubview(weightLabel)
        headerView.addSubview(gradeLabel)
        
        classNameLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(headerView)
            make.right.equalTo(headerView).offset(-(weightLabelWidth + gradeLabelWidth))
        }
        
        weightLabel.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(headerView).offset(-gradeLabelWidth)
            make.width.equalTo(weightLabelWidth)
        }
        
        gradeLabel.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(headerView)
            make.width.equalTo(gradeLabelWidth)
        }
        
        self.tableHeaderView = headerView
        /*headerView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(tableHeaderHeight)
            make.width.equalTo(self)
        }*/
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
