//
//  Client.swift
//  JSON
//
//  Created by Oscar Swanros on 7/16/14.
//  Copyright (c) 2014 TheSwiftLangBlog. All rights reserved.
//

import Foundation

class Client: NSObject {
    var name: String?
    var email: String?
    var company: String?
    
    init(name: String, email: String, company: String) {
        self.name = name
        self.email = email
        self.company = company
    }
    
    init() {}
}
