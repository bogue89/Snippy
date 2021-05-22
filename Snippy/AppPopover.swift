//
//  AppPopover.swift
//  Snippy
//
//  Created by Jorge Alberto Benavides Ojinaga on 22/05/21.
//

import SwiftUI

class AppPopover<ContentView:View>: NSPopover {
    
    init(contentView: ContentView) {
        super.init()
        self.contentSize = NSSize(width: 320, height: 600)
        self.behavior = .transient
        self.contentViewController = NSHostingController(rootView: contentView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
