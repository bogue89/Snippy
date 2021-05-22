//
//  StatusBarItem.swift
//  Snippy
//
//  Created by Jorge Alberto Benavides Ojinaga on 22/05/21.
//

import Cocoa

class StatusBarItem {
    
    var statusItem: NSStatusItem!
    var popover: NSPopover!
    
    init(popover: NSPopover) {
        self.popover = popover
        self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        self.statusItem.button?.title = "Snippy"
        self.statusItem.button?.action = #selector(showStatusBarPopover)
        self.statusItem.button?.target = self
    }
    
    @objc func showStatusBarPopover() {
        guard let button = self.statusItem?.button else { return }
        self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
    }
}
