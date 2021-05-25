//
//  Screenshot.swift
//  Snippy
//
//  Created by Jorge Alberto Benavides Ojinaga on 23/05/21.
//

import Cocoa

class Screenshot: Identifiable {
    var id = UUID()
    var cgImage: CGImage!
    var size: CGSize!
    init?() {
        let displayID = Screen.getMainDisplayID()
        guard let cgImage = try? Screen.createImageFromDisplay(displayID)else { return nil}
        self.cgImage = cgImage
    }
    init(_ cgImage: CGImage) {
        self.cgImage = cgImage
    }
    init(_ nsImage: NSImage) {
        self.size = nsImage.size
        self.cgImage = nsImage.cgImage()
    }
    var data: Data? {
        guard
            let cgImage = self.cgImage,
            let mutableData = CFDataCreateMutable(nil, 0),
            let destination = CGImageDestinationCreateWithData(mutableData, "public.png" as CFString, 1, nil)
        else { return nil }
        CGImageDestinationAddImage(destination, cgImage, nil)
        guard CGImageDestinationFinalize(destination) else { return nil }
        return mutableData as Data
    }
    func image(size: CGSize? = nil) -> NSImage? {
        return NSImage(cgImage: cgImage, size: size ?? self.size ?? CGSize.zero)
    }
}
extension NSImage {
    func cgImage() -> CGImage? {
        var imageRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        return self.cgImage(forProposedRect: &imageRect, context: nil, hints: nil)
    }
}
