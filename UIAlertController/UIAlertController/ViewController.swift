//
//  ViewController.swift
//  UIAlertController
//
//  Created by Oscar Swanros on 6/4/14.
//  Copyright (c) 2014 TheSwiftLangBlog. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButton = UIBarButtonItem(title: "Alert", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("rightButtonTapped"))
        let leftButton = UIBarButtonItem(title: "Action Sheet", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("leftButtonTapped"))
        
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    func rightButtonTapped() {
        let alert = UIAlertController(title: "Alert", message: "This is the message", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Do Something", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction!) in
            println("\(action) tapped")
            }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func leftButtonTapped() {
        let alert = UIAlertController(title: "Action Sheet", message: "This is the message", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "Do Something", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction!) in
            println("\(action) tapped")
            }))
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

