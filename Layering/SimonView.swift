//
//  SimonView.swift
//  Layering
//
//  Created by Daniel Bolella on 8/30/19.
//  Copyright © 2019 Daniel Bolella. All rights reserved.
//

//Wedge Credit: https://stackoverflow.com/questions/57106682/swiftui-wedge-shape-with-inner-stroke

import SwiftUI

struct SimonView : View {
    let wedges = [
        Wedge(startAngle: 0, endAngle: 90, color: Color.red),
        Wedge(startAngle: 90, endAngle: 180, color: Color.green),
        Wedge(startAngle: 180, endAngle: 360, color: Color.blue)
    ]
    @State var rollOut = false
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0 ..< wedges.count) {
                    WedgeShape(
                        startAngle: Angle(degrees: self.wedges[$0].startAngle),
                        endAngle: Angle(degrees: self.rollOut ?  self.wedges[$0].endAngle : 0),
                        lineWidth: 44
                    )
                    .foregroundColor(self.wedges[$0].color)
                    .animation(.basic(duration: 5.0, curve: .linear))
                    .onAppear(){
                        self.rollOut.toggle()
                    }
                }
            }
        }
    }
}

struct WedgeShape: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let lineWidth: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let center =  CGPoint(x: rect.size.width/2, y: rect.size.width/2)
        let r1 = rect.size.width/2
        p.addArc(center: center, radius: abs(lineWidth - r1), startAngle: startAngle, endAngle: endAngle, clockwise: false)
        p.addArc(center: center, radius: r1, startAngle: endAngle, endAngle: startAngle, clockwise: true)
        p.closeSubpath()
        return p
    }
}

struct Wedge {
    var startAngle: Double
    var endAngle: Double
    var color: Color
}

#if DEBUG
struct SimonView_Previews : PreviewProvider {
    static var previews: some View {
        SimonView()
    }
}
#endif
