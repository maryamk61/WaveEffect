//
//  WaveEffectModifier.swift
//  WaveEffectModifier
//
//  Created by Maryam Kaveh on 5/18/1403 AP.
//

import Foundation
import SwiftUI

struct WaveEffectModifier: ViewModifier {
    private var progress: CGFloat
    private var animationDuration: TimeInterval
    private var flexibility: CGFloat
    private var lightBlue: UIColor = #colorLiteral(red: 0.3369271755, green: 0.5280345678, blue: 0.6806644201, alpha: 1)
    private var mediumBlue: UIColor = #colorLiteral(red: 0.01568627451, green: 0.3882352941, blue: 0.6470588235, alpha: 1)
    private var darkBlue: UIColor = #colorLiteral(red: 0.01568627451, green: 0.3882352941, blue: 0.6470588235, alpha: 1)
    
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 180)
    @State private var waveOffset3 = Angle(degrees: 90)
    
    init(
        progress: CGFloat,
        animationDuration: TimeInterval,
        flexibility: CGFloat) {
        self.progress = progress
        self.animationDuration = animationDuration
        self.flexibility = flexibility
    }
    
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            content
            
            WaveShape(offset: Angle(degrees: waveOffset3.degrees), progress: progress , flexibility: flexibility )
                .fill(Color(lightBlue).opacity(0.4))
                .frame(width: 345, height: 370)
            
            WaveShape(offset: Angle(degrees: waveOffset2.degrees), progress: progress, flexibility: flexibility * 0.7)
                .fill(Color(mediumBlue).gradient.opacity(0.7))
                .frame(width: 345, height: 370)
            
            WaveShape(offset: Angle(degrees: waveOffset.degrees), progress: progress, flexibility: flexibility * 1.1)
                .fill(Color(darkBlue).gradient)
                .frame(width: 345, height: 370)
        }
        
        .onChange(of: animationDuration) { old, new in
            withAnimation(.linear(duration: 0)) {
                waveOffset = Angle(degrees: 0)
                waveOffset2 = Angle(degrees: 180)
                waveOffset3 = Angle(degrees: 90)
            }
            withAnimation(.linear(duration: new).repeatForever(autoreverses: false)) {
                waveOffset = Angle(degrees: -360)
                waveOffset2 = Angle(degrees: -180)
                waveOffset3 = Angle(degrees: -270)
            }
        }
        .onAppear {
            withAnimation(.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                waveOffset = Angle(degrees: -360)
                waveOffset2 = Angle(degrees: -180)
                waveOffset3 = Angle(degrees: -270)
            }
            
        }
    }
}
