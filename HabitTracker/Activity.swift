//
//  Activity.swift
//  HabitTracker
//
//  Created by Yuri Gerasimchuk on 04.06.2022.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    var target: Int
    
    static let example = Activity(title: "Example activity", description: "This is an example activity", target: 0)
}
