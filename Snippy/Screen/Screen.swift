//
//  Screen.swift
//  Snippy
//
//  Created by Jorge Alberto Benavides Ojinaga on 22/05/21.
//

import Cocoa

class Screen {
    enum AccessError: Error {
        case display
        case folder
    }
    static func getMainDisplayID() -> CGDirectDisplayID {
        guard let screen = NSScreen.main else {
            return CGMainDisplayID()
        }
        return getDisplayID(withPoint: screen.frame.origin)
    }
    static func getDisplayID(withPoint point: CGPoint) -> CGDirectDisplayID {
        let displayList = UnsafeMutablePointer<CGDirectDisplayID>.allocate(capacity: 1)
        CGGetActiveDisplayList(1, displayList, nil)
        CGGetDisplaysWithPoint(point, 1, displayList, nil)
        return displayList[0]
    }
    static func getDisplaySize(_ displayID: CGDirectDisplayID) -> NSSize {
        return NSSize(width: CGDisplayPixelsWide(displayID), height: CGDisplayPixelsHigh(displayID))
    }
    static func getRectFromDisplayID(_ displayID: CGDirectDisplayID, point origin: NSPoint, and destination: NSPoint) -> CGRect {
        let size = CGSize(width: abs(origin.x - destination.x), height: abs(origin.y - destination.y))
        var rect = CGRect(origin: origin, size: size)
        if origin.x > destination.x {
            rect.origin.x = destination.x
        }
        if origin.y < destination.y {
            rect.origin.y = destination.y
        }
        let frame = getDisplaySize(displayID)
        rect.origin.y = frame.height - rect.origin.y
        return rect
    }
    static func createImageFromDisplay(_ displayID: CGDirectDisplayID) throws -> CGImage  {
        guard let image = CGDisplayCreateImage(displayID) else {
            throw AccessError.display
        }
        return image
    }
}
