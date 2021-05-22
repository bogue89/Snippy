//
//  DashboardView.swift
//  Snippy
//
//  Created by Jorge Alberto Benavides Ojinaga on 22/05/21.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject
    var viewModel = Dashboard()
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
            
            List(viewModel.screenshots, id: \.self) { screenshot in
                Image(nsImage: screenshot)
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
            view.viewModel.addScreeshot(NSImage(named: "Placeholder")!)
        }
        return view
    }
}
