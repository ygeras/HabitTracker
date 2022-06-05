//
//  RingShape.swift
//  HabitTracker
//
//  Created by Yuri Gerasimchuk on 05.06.2022.
//

import SwiftUI

struct RingShape: InsettableShape {
    var percent: Double
    let startAngle: Double
    var insetAmount: CGFloat
    
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    
    init(percent: Double = 1.0, startAngle: Double = -90, insetAmount: CGFloat = 0.0) {
        self.percent = percent
        self.startAngle = startAngle
        self.insetAmount = insetAmount
    }
    
    static func percentToAngel(percent: Double, startAngle: Double) -> Double {
        return (percent * 360) + startAngle
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = (min(height, width) / 2) - insetAmount
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let endAngle = Self.percentToAngel(percent: percent, startAngle: startAngle)
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
        }
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var ringShape = self
        ringShape.insetAmount += amount
        return ringShape
    }
}

