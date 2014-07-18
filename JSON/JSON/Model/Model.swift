//
//  Model.swift
//  JSON
//
//  Created by Oscar Swanros on 7/16/14.
//  Copyright (c) 2014 TheSwiftLangBlog. All rights reserved.
//

import Foundation

class Model: NSObject {
    
    class func getClients() -> [Client] {
        var filePath = NSBundle.mainBundle().pathForResource("data", ofType: "json")
        var data = NSData.dataWithContentsOfFile(filePath, options: .DataReadingMappedAlways, error: nil)
        
        var JSONError: NSError?
        let JSONDict = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &JSONError) as NSDictionary
        
        var finalClientArray: [Client] = Array()
        
        if let clientsArray = JSONDict["clients"] as? [NSDictionary] {
            for clientDict in clientsArray {
                var newClient = Client()
                
                if let clientName = clientDict["name"] as? String {
                    newClient.name = clientName
                }
                
                if let clientEmail = clientDict["email"] as? String {
                    newClient.email = clientEmail
                }
                
                if let clientCompany = clientDict["company"] as? String {
                    newClient.company = clientCompany
                }
                
                finalClientArray.append(newClient)
            }
        }
        
        return finalClientArray
    }
    
}