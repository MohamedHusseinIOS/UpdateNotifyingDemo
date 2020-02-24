//
//  ViewController.swift
//  UpdateNotifyingDemo
//
//  Created by mohamed hussein on 2/23/20.
//  Copyright © 2020 Mohamed Hussein. All rights reserved.
//

import UIKit
import Updates

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateNotifying()
    }
    
    func updateNotifying() {
        // programmatically configuration
        //Updates.appStoreId = "1372788277"
        Updates.updatingMode = .automatically
        Updates.notifying = .once
        Updates.countryCode = "SA"
        //Updates.bundleIdentifier = "com.platformCodes.Investment"
        
        Updates.checkForUpdates { (result) in
            UpdatesUI.promptToUpdate(result, presentingViewController: self)
        }
    }
    
}

