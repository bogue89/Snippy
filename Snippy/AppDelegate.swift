//
//  AppDelegate.swift
//  Snippy
//
//  Created by Jorge Alberto Benavides Ojinaga on 22/05/21.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var popover: AppPopover<DashboardView>!
    var statusItem: StatusBarItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // Create the SwiftUI view that provides the window contents.
        let contentView = DashboardView()
        
        // Create the Popover
        self.popover = AppPopover(contentView: contentView)
        
        // Create the Status Bar Item
        self.statusItem = StatusBarItem(popover: self.popover)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

