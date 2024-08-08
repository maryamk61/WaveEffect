//
//  ContentView.swift
//  WaveEffectModifier
//
//  Created by Maryam Kaveh on 5/12/1403 AP.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0.3
    @State private var animationDuration: TimeInterval = 3
    @State private var flexibility: CGFloat = 1
    
    var body: some View {
        
        VStack(spacing: 60) {
            measurementSection
            
            ZStack {
                Image("glass")
                    .resizable()
                    .shadow(color: .gray.opacity(0.3) ,radius: 3, x: 0, y: 20)
                Image("ice1")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .offset(y: 150)
            }
            .waveEffect(progress: progress, animationDuration: animationDuration, flexibility: flexibility)
            .mask {
                Image("glass")
                    .resizable()
            }
            .frame(width: 300, height: 480)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    var measurementSection: some View {
        VStack(spacing: 10) {
            Text("Progress \(Int(progress * 100))%")
                .bold()
            HStack {
                Text("0%")
                Slider(value: $progress, in: 0...1)
                Text("100%")
            }
            Divider()
            
            Text("Animation Duration \(animationDuration, specifier: "%.1f")s")
                .bold()
            HStack {
                Text("0.0")
                Slider(value: $animationDuration, in: 0.0...10.0, step: 0.02)
                Text("10.0")
            }
            Divider()
            
            Text("Flexibility \(flexibility, specifier: "%.1f")")
                .bold()
            HStack {
                Text("0")
                Slider(value: $flexibility, in: 0...5)
                Text("5")
            }
            Divider()
        }
    }
}
