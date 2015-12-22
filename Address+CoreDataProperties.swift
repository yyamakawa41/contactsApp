//
//  Address+CoreDataProperties.swift
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

extension Address {

    @NSManaged var city: String?
    @NSManaged var state: String?
    @NSManaged var street: String?
    @NSManaged var zipCode: String?
    @NSManaged var contact: Contact?

}
