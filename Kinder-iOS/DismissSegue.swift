//
//  DismissSegue.swift
//  Kinder-iOS
//
//  Created by CANTE Benjamin on 22/03/2015.
//  Copyright (c) 2015 CANTE Benjamin. All rights reserved.
//

import UIKit

// Principal Segue to use when returning to an already displayed view : actions like Back, Cancel, ...
@objc(DismissSegue) class DismissSegue: UIStoryboardSegue {
   
    override func perform() {
        if let controller = sourceViewController as? UIViewController {
            NSLog("SEG - perform : (DismissSegue) Trying to display destination by dismissing sending controller")
            controller.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
}
