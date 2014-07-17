//
//  Model.swift
//  JSON
//
//  Created by Oscar Swanros on 7/16/14.
//  Copyright (c) 2014 TheSwiftLangBlog. All rights reserved.
//

import Foundation

class Model: NSObject {
    class func getClients(completion: (array: [Client]) -> Void) -> Void {
        
        var finalClientArray: [Client] = Array()
        
        var filePath = NSBundle.mainBundle().pathForResource("data", ofType: "json")
        var data = NSData.dataWithContentsOfFile(filePath, options: .DataReadingMappedAlways, error: nil)
        
        var JSONError: NSError?
        let JSONDict = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &JSONError) as NSDictionary
        
        if let clientsArray: [NSDictionary] = JSONDict.objectForKey("clients") as? [NSDictionary] {
            for clientDict in clientsArray {
                var newClient: Client = Client()
                
                if let clientName: String = clientDict["name"] as? String {
                    newClient.name = clientName
                }
                
                if let clientEmail: String = clientDict["email"] as? String {
                    newClient.email = clientEmail
                }
                
                if let clientCompany: String = clientDict["company"] as? String {
                    newClient.company = clientCompany
                }
                
                finalClientArray.append(newClient)
            }
            
            dispatch_async(dispatch_get_main_queue()){
                completion(array: finalClientArray)
            }
        }
    }
}