//
//  DataManager.swift
//  contactsApp
//
//  Created by Yohsuke Yamakawa on 11/9/15.
//  Copyright © 2015 DigitalCrafts. All rights reserved.
//

import Foundation

struct DataManager{
static let sharedManager = DataManager()

func saveContacts(contacts:[Contact]) {
    
    let destinationPath = self.filePathForArchiving()
    NSKeyedArchiver.archiveRootObject(contacts, toFile:destinationPath)
    //We'll implement this later
}
func loadContacts() -> [Contact]? {
    let destinationPath = self.filePathForArchiving()
    if let contacts : [Contact] =
    NSKeyedUnarchiver.unarchiveObjectWithFile(destinationPath) as?
    [Contact] {
    return contacts
    }
    return [Contact]()
}

    private func filePathForArchiving() -> String {
        let documentsPath =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
        .UserDomainMask, true)[0] as String
        let destinationPath = "\(documentsPath)/SavedContacts"
        return destinationPath
    }

}
