//
//  Kinder-iOS.swift
//  Kinder-iOS
//
//  Created by Mac portable b_can on 12/04/2015.
//  Copyright (c) 2015 Niv-Babs. All rights reserved.
//

import UIKit
import CoreData

class User: NSManagedObject {

    @NSManaged var pseudo: String
    @NSManaged var email: String
    @NSManaged var password: String
    @NSManaged var repeat: String
    @NSManaged var birthday: NSDate
    @NSManaged var gender: NSNumber
    @NSManaged var done: NSNumber

    // MARK: - Class Functions
    
    // Get user's login/email
    class func getLogin() -> String {
        return getUser().email
    }
    class func getBirthday() -> NSDate {
        return getUser().birthday
    }
    
    // Get user's entity
    class func getUser() -> User {
        var user = User()
        // Retrieve CoreData Context manager
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        //Check User Entities
        var error: NSError? = nil
        var fReq: NSFetchRequest = NSFetchRequest(entityName: "User")
        var result: NSArray = managedObjectContext!.executeFetchRequest(fReq, error: &error)!
        if (result.count>0){
            println("RESULT #\(result.count)= \(result) ")
            //TODO Display an alert to delete a previous account
            //Select first User
            println("We get the firt user")
            user = result[0] as! User
            user.done = false
        }else{
            //Add empty User
            println("We create a new user")
            let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext!)
            user = User(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
            user.pseudo = ""
            user.email = ""
            user.password = ""
            user.repeat = ""
            user.gender = 0
            user.done = false
            user.birthday = NSDate()
            managedObjectContext?.save(&error)
            if let err = error {
                // handle error
            }
        }
        return user
    }
    
    // Create new user's entity
    class func createBasicUser(pseudo: String) -> User {
        var user = User()
        //
        user.pseudo = pseudo
        return user
    }
    
}

