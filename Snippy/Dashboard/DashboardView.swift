//
//  DashboardView.swift
//  Snippy
//
//  Created by Jorge Alberto Benavides Ojinaga on 22/05/21.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject
    var viewModel = DashboardViewModel()
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            HStack(alignment: .center, spacing: 10, content: {
                Button("Take screenshot") {
                    viewModel.takeScreenshot()
                }
                Button("Cut screenshot") {
                    viewModel.takeSelectionScreeshot()
                }
            })
            
            List(viewModel.screenshots) { screenshot in
                Image(nsImage: screenshot.image(size: CGSize(width: 320, height: 180))!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        })
        .padding(10)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        let view = DashboardView()
        for _ in 0..<10 {
            view.viewModel.addScreeshot(Screenshot(NSImage(named: "Placeholder")!))
        }
        return view
    }
}
