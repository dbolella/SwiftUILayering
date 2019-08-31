//
//  CircleSelectorView.swift
//  Layering
//
//  Created by Daniel Bolella on 8/30/19.
//  Copyright © 2019 Daniel Bolella. All rights reserved.
//

import SwiftUI

struct CircleSelectorView : View {
    @State var grow = false
    let colors = [Color.blue, Color.red, Color.green, Color.yellow]
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(1 ..< 5) { item in
                    Circle()
                        .trim(from: self.grow ? (0.25 * (item - 1)) : (0.25 * item) , to: (0.25 * item))
                        .stroke(colors[item], lineWidth: 30)
                        .frame(width: 300, height: 300)
                        .animation(.basic(duration: 0.5, curve: .linear))
                }
//                Circle()
//                    .trim(from: grow ? 0.25 : 0.5 , to: 0.5)
//                    .stroke(Color.red, lineWidth: 30)
//                    .frame(width: 300, height: 300)
//                    .animation(.basic(duration: 0.5, curve: .linear))
//                Circle()
//                    .trim(from: grow ? 0.5 : 0.75 , to: 0.75)
//                    .stroke(Color.green, lineWidth: 30)
//                    .frame(width: 300, height: 300)
//                    .animation(.basic(duration: 0.5, curve: .linear))
//                Circle()
//                    .trim(from: grow ? 0.75 : 1 , to: 1.0)
//                    .stroke(Color.yellow, lineWidth: 30)
//                    .frame(width: 300, height: 300)
//                    .animation(.basic(duration: 0.5, curve: .linear))
            }
        }
        .rotationEffect(.degrees(self.grow ? 0: 90))
        .animation(.fluidSpring())
            .onAppear {
                self.grow.toggle()
        }
    }
}

#if DEBUG
struct CircleSelectorView_Previews : PreviewProvider {
    static var previews: some View {
        CircleSelectorView()
    }
}
#endif
