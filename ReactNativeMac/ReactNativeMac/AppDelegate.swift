//
//  AppDelegate.swift
//  ReactNativeMac
//
//  Created by Hui Hui on 25/9/15.
//  Copyright © 2015 Hui Hui. All rights reserved.
//

import Cocoa
import ReactNativeMacLib

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet var masterViewController: MasterViewController!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        masterViewController = MasterViewController(nibName: "MasterViewController", bundle: nil)
        self.window.contentView?.addSubview(masterViewController.view)
        self.masterViewController.view.frame = self.window.contentView!.bounds
        
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

