//
//  NewContactDelegate.swift
//  contactsApp
//
//  Created by Yohsuke Yamakawa on 11/11/15.
//  Copyright © 2015 DigitalCrafts. All rights reserved.
//

import Foundation

protocol NewContactDelegate : class {
    func didCreateNewContact(newContact:Contact)
}

