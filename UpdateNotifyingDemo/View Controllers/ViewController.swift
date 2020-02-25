//
//  ViewController.swift
//  UpdateNotifyingDemo
//
//  Created by mohamed hussein on 2/23/20.
//  Copyright © 2020 Mohamed Hussein. All rights reserved.
//

import UIKit
import Updates

class ViewController: BaseViewController {

    
    let viewModel = ViewModel()
    
    private let appStoreId = "1372788277"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //updateNotifying()
        viewModel.getAppData(appStoreId: appStoreId , country: "SA")
    }
    // Updates Demo
//    func updateNotifying() {
//        // programmatically configuration
//        //Updates.appStoreId = "1372788277"
//        Updates.updatingMode = .automatically
//        Updates.notifying = .once
//        Updates.countryCode = "SA"
//        //Updates.bundleIdentifier = "com.platformCodes.Investment"
//
//        Updates.checkForUpdates { (result) in
//            UpdatesUI.promptToUpdate(result, presentingViewController: self)
//        }
//    }
    
    override func configureData() {
        viewModel.output
            .needUpdate
            .subscribe { [unowned self] (event) in
                guard let isNeedUpdate = event.element else { return }
                if isNeedUpdate {
                    self.alert(title: "New Version On App store", message: "") {
                        guard let appURL = URL(string: "itms://itunes.apple.com/us/app/\(self.appStoreId)") else { return }
                        UIApplication.shared.open(appURL)
                    }
                }
        }.disposed(by: viewModel.bag)
    }
    
}

