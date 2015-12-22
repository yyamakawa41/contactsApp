//
//  Contact+CoreDataProperties.swift
//  contactsApp
//
//  Created by Yohsuke Yamakawa on 12/21/15.
//  Copyright © 2015 DigitalCrafts. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var phoneNumber: String?
    @NSManaged var address: Address?

}
