//
//  ContactsDetailViewController.swift
//  contactsApp
//
//  Created by Yohsuke Yamakawa on 11/9/15.
//  Copyright © 2015 DigitalCrafts. All rights reserved.
//

import UIKit

class ContactsDetailViewController: UIViewController, NewContactDelegate {
    var selectedContact : Contact!
    
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var streetAddress: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var state: UILabel!
    
    @IBOutlet weak var zipCode: UILabel!
    
    func didUpdateContact(contact: Contact) {
        self.selectedContact = contact
        self.updateTextFields()
    }
    
    func didCreateNewContact(newContact: Contact) {
            //Intentionally left blank
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditContactSegue" {
        if let vc = segue.destinationViewController as?
        NewContactViewController {
        vc.delegate = self
        vc.editContactId = self.selectedContact.contactId
        }
        }
    }
    
    func updateTextFields() {
        self.firstName.text = self.selectedContact?.firstName
        self.lastName.text = self.selectedContact?.lastName
        self.phoneNumber.text = self.selectedContact?.phoneNumber
        self.streetAddress.text = self.selectedContact?.address?.street
        self.city.text = self.selectedContact?.address?.city
        self.state.text = self.selectedContact?.address?.state
        self.zipCode.text = self.selectedContact?.address?.zipCode
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstName.text = self.selectedContact.firstName
        self.lastName.text = self.selectedContact.lastName
        self.phoneNumber.text = self.selectedContact.phoneNumber
        self.streetAddress.text = self.selectedContact.address?.street
        self.city.text = self.selectedContact.address?.city
        self.state.text = self.selectedContact.address?.state
        self.zipCode.text = self.selectedContact.address?.zipCode
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
