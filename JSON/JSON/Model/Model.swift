//
//  Model.swift
//  JSON
//
//  Created by Oscar Swanros on 7/16/14.
//  Copyright (c) 2014 TheSwiftLangBlog. All rights reserved.
//

import Foundation

class Model: NSObject {
    struct Static {
        static var token: dispatch_once_t = 0
        static var instance: Model?
    }
    
    class var sharedInstance: Model {
    dispatch_once(&Static.token) {
        Static.instance = Model()
        }
        
        return Static.instance!
    }
    
    init() {
        assert(Static.instance == nil, "Class already initialised")
    }
    
    func getClients(completion: (array: [Client]) -> Void) -> Void {
        
        var finalClientArray: [Client] = Array()
        
//        var request = NSURLRequest(URL: NSURL(string: "http://localhost:3000/api/v1/clients"))
//        var session = NSURLSession.sharedSession()
//        let dataTask = session.dataTaskWithRequest(request, completionHandler:
//            {(data: NSData!, response: NSURLResponse!, error: NSError!) in
//                var JSONError: NSError?
//                let JSONDict = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &JSONError) as NSDictionary
//                
//                if let clientsArray: [NSDictionary] = JSONDict.objectForKey("clients") as? [NSDictionary] {
//                    for clientDict in clientsArray {
//                        var newClient: Client = Client()
//                        
//                        if let clientName: String = clientDict["name"] as? String {
//                            newClient.name = clientName
//                        }
//                        
//                        if let clientEmail: String = clientDict["email"] as? String {
//                            newClient.email = clientEmail
//                        }
//                        
//                        if let clientCompany: String = clientDict["company"] as? String {
//                            newClient.company = clientCompany
//                        }
//                        
//                        finalClientArray.append(newClient)
//                    }
//                    
//                    dispatch_async(dispatch_get_main_queue()){
//                        completion(array: finalClientArray)
//                    }
//                }
//            })
//        
//        dataTask.resume()
        
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