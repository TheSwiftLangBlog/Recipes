//
//  ViewController.swift
//  TableViews
//
//  Created by Oscar Swanros on 6/7/14.
//  Copyright (c) 2014 TheSwiftLangBlog. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var cell: UITableViewCell?
    @lazy var tableView: UITableView = {
        var t = UITableView(frame: self.view.bounds, style: .Plain)
        t.delegate = self
        t.dataSource = self
        t.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? UITableViewCell
        
        if !cell{
            cell = UITableViewCell(style: .Value1, reuseIdentifier: "Cell")
        }
        
        cell!.textLabel.text = "\(indexPath.row)"
        
        return cell
    }
    
}
