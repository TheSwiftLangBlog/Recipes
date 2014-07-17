//
//  ViewController.swift
//  JSON
//
//  Created by Oscar Swanros on 7/16/14.
//  Copyright (c) 2014 TheSwiftLangBlog. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var clientsArray: [Client] = Array()
    
    @lazy var refreshControl: UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: "reload", forControlEvents: .ValueChanged)
        
        return rc
        }()
    
    @lazy var tableView: UITableView = {
        let tv = UITableView(frame: self.view.bounds, style: .Plain)
        
        tv.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        tv.delegate = self
        tv.dataSource = self
        return tv
        }()
    
    @lazy var rightButton: UIBarButtonItem = {
        let right = UIBarButtonItem(title: "Reload!", style: .Plain, target: self, action: "reload")
        return right
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        
        self.navigationItem.rightBarButtonItem = rightButton
        
        self.title = "Client List"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///
    
    func reload() -> Void {
        Model.sharedInstance.getClients({array in
            self.clientsArray = array;
            self.tableView.reloadData()
            
            self.refreshControl.endRefreshing()
            })
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return clientsArray.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "Cell")
        
        let client: Client = self.clientsArray[indexPath.row]
        
        cell.textLabel.text = client.name
        cell.detailTextLabel.text = client.email
        
        return cell
    }
    
}

