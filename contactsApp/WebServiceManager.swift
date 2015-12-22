//
//  WebServiceManager.swift
//  contactsApp
//
//  Created by Yohsuke Yamakawa on 11/16/15.
//  Copyright © 2015 DigitalCrafts. All rights reserved.
//

import Foundation

struct WebServiceManager{
    func fetchContacts(callback : ([Contact]) -> Void){
        
        let url = NSURL(string: "http://jsonplaceholder.typicode.com/users")
        let request = NSURLRequest(URL: url!)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response,
            err in
            //Code goes here
            if err == nil {
                //Processing code goes here
                var contactList = [Contact]()
                do{
                    if let jsonArray : [ [String : AnyObject] ] =
                        try NSJSONSerialization.JSONObjectWithData(data!, options:
                            NSJSONReadingOptions.AllowFragments)as? [ [String:AnyObject] ] {
                                //Use the jsonArray here
                                
                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                    
                                    for jsonDict in jsonArray {
                                        //Use jsonDict here
                                        let newContact = self.parseContact(jsonDict)
                                        contactList.append(newContact)
                                    }
                                    callback(contactList)
                                    
                                })
                    }
                }
                catch{
                    callback([])
                }
            }
            else {
                //Got an error, so print it out
                print("Got an error: \(err)")
            }
        }
        task.resume()
        
    }
    
    
    private func parseContact(jsonDict : [String:AnyObject]) ->
        Contact {
            let newContact = DataManager.sharedManager.createContact()
            //Use newContact here
            newContact.phoneNumber = jsonDict["phone"] as? String
            if let addressDict = jsonDict["address"] as? [String : AnyObject]
            {
                //Use the properties of addressDict here
                newContact.address?.street = addressDict["street"] as? String
                newContact.address?.city = addressDict["city"] as? String
                newContact.address?.zipCode = addressDict["zipcode"] as? String
            }
            if let fullName = jsonDict["name"] as? String {
                //Use fullName here
                let fullNameArray = fullName.componentsSeparatedByString(" ")
                if fullNameArray.count > 1 {
                    //Use fullNameArray here
                    newContact.firstName = fullNameArray[0]
                    newContact.lastName = fullNameArray[1]
                }
            }
            
            DataManager.sharedManager.save()
            return newContact
    }
    
}






