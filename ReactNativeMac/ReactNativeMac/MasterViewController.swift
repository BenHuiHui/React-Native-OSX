//
//  MasterViewController.swift
//  ReactNativeMac
//
//  Created by Hui Hui on 25/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

import Cocoa
import JavaScriptCore

class MasterViewController: NSViewController {

    
    override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Evaluate javascript 
    }
    
}
