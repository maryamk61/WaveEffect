//
//  WaveShape.swift
//  WaveEffectModifier
//
//  Created by Maryam Kaveh on 5/18/1403 AP.
//

import Foundation
import SwiftUI

struct WaveShape: Shape {
    var offset: Angle
    var progress: CGFloat
    var flexibility: CGFloat
    
    var animatableData: Double {
        get { offset.degrees}
        set { offset = Angle(degrees: newValue)}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let waveHeight = rect.height * 0.015
        let yOffset = (1 - progress) * (rect.height - 2 * waveHeight) + waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        
        //sine value can be understood as the y-axis of a point on the unit circle drawn from the specified angle.
        path.move(to: CGPoint(x: 0, y: yOffset + waveHeight * CGFloat(sin(offset.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 10) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * 2.5 * rect.width
            path.addLine(to: CGPoint(x: x, y: yOffset + flexibility * waveHeight * sin(Angle(degrees: angle).radians)))
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
        
    }
}
