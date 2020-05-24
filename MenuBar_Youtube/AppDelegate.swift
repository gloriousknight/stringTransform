//
//  AppDelegate.swift
//  MenuBar_Youtube
//
//  Created by Glorious on 2020/3/24.
//  Copyright © 2020 Glorious. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "☆"
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showSettings)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    @objc func showSettings() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc  = storyboard.instantiateController(withIdentifier: "ViewController") as? ViewController else{
            fatalError("Unabele to find ViewController in storyboard.")
        }
        
        guard let button =  statusItem.button else {
            
            fatalError("Couldn't find status item button.")
        }
        
        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        popoverView.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
    }

}

