//
//  Pasteboard.swift
//  Snippy
//
//  Created by Jorge Alberto Benavides Ojinaga on 23/05/21.
//

import Cocoa

class Pasteboard {
    @discardableResult
    static func set(_ screenshot: Screenshot) -> Bool {
        guard let data = screenshot.data else { return false }
        
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.png], owner: nil)
        
        return pasteboard.setData(data, forType: .png)
    }
}
