//
//  Ring.swift
//  HabitTracker
//
//  Created by Yuri Gerasimchuk on 05.06.2022.
//

import SwiftUI

struct Ring: View {
    let lineWidth: CGFloat
    let gradientColor: AngularGradient
    let dotColor: Color
    let percentage: Double
    var insetAmount: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Track
                RingShape(insetAmount: insetAmount)
                    .stroke(gradientColor, style: StrokeStyle(lineWidth: lineWidth))
                    .opacity(0.3)
                
                // Ring
                RingShape(percent: percentage, insetAmount: insetAmount)
                    .stroke(gradientColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                
                Circle()
                    .frame(width: lineWidth, height: lineWidth)
                    .foregroundColor(dotColor)
                    .offset(y: (-geometry.size.width / 2) + (lineWidth / 2) + insetAmount)
            }
            .padding(lineWidth / 2)
        }
    }
}
