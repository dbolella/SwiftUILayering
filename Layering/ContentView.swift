//
//  ContentView.swift
//  Layering
//
//  Created by Daniel Bolella on 8/30/19.
//  Copyright © 2019 Daniel Bolella. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var showOverlay = false
    var body: some View {
        VStack {
            Text("Test")
                .overlay(showOverlay ? CircleSelectorView() : nil)
                .tapAction { self.showOverlay.toggle() }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
