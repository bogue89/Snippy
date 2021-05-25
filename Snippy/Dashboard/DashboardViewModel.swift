//
//  DashboardViewModel.swift
//  Snippy
//
//  Created by Jorge Alberto Benavides Ojinaga on 22/05/21.
//

import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published
    var screenshots:[Screenshot] = []
    var screenshotsCount: Int { screenshots.count }
    func takeScreenshot() {
        guard let screenshot = Screenshot() else { return }
        addScreeshot(screenshot)
    }
    func takeSelectionScreeshot() {
        
    }
    func addScreeshot(_ img: Screenshot) {
        Pasteboard.set(img)
        screenshots.insert(img, at: 0)
        if screenshots.count > 10 {
            screenshots.removeSubrange(10..<screenshots.count)
        }
    }
}
