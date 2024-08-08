//
//  Extension+View.swift
//  WaveEffectModifier
//
//  Created by Maryam Kaveh on 5/18/1403 AP.
//

import Foundation
import SwiftUI

extension View {
    func waveEffect( 
        progress: CGFloat,
        animationDuration: TimeInterval,
        flexibility: CGFloat
    ) -> some View {
        modifier(WaveEffectModifier(progress: progress, animationDuration: animationDuration, flexibility: flexibility))
    }
}
