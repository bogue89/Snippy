//
//  Dashboard.swift
//  Snippy
//
//  Created by Jorge Alberto Benavides Ojinaga on 22/05/21.
//

import SwiftUI

class Dashboard: ObservableObject {
    @Published
    var screenshots:[NSImage] = []
    var screenshotsCount: Int { screenshots.count }
    func takeScreenshot() {
        let displayID = Screen.getMainDisplayID()
        guard
        let cgImage = try? Screen.createImageFromDisplay(displayID) else { return }
        let image = NSImage(cgImage: cgImage, size: NSSize(width: 420, height: 80))
        addScreeshot(image)
    }
    func takeSelectionScreeshot() {
        //addScreeshot(image)
    }
    func addScreeshot(_ image: NSImage) {
        screenshots.insert(image, at: 0)
        if screenshots.count > 10 {
            screenshots.removeSubrange(10..<screenshots.count)
        }
    }
}

