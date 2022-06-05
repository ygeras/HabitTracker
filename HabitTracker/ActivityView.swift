//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Yuri Gerasimchuk on 04.06.2022.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var data: Activities
    var activity: Activity
    let ringColor = AngularGradient(colors: [.blue, .green], center: .center, startAngle: .degrees(-90), endAngle: .degrees(270))
    
    var percentageCompletion: Double {
        guard activity.target != 0 else { return 0 }
        return Double(activity.completionCount) / Double(activity.target)
    }
    
    var body: some View {
        List {
            Section {
                if activity.description.isEmpty == false {
                    Text(activity.description)
                }
            }
            
            Section {
                Text("Completion count: \(activity.completionCount)")
                Text("Your target: \(activity.target)")
            }
          
        }
        .overlay(
            Button(action: {
                var newActivity = activity
                newActivity.completionCount += 1
                
                if let index = data.activities.firstIndex(of: activity) {
                    data.activities[index] = newActivity
                }
            }, label: {
                Text("Mark completed")
                    .font(.title3)
            })
            .padding()
            .foregroundColor(.white)
            .background(Color.blue.opacity(0.9))
            .cornerRadius(15)
            .shadow(radius: 5)
            .offset(y: -50)
        )
        .overlay(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            Ring(lineWidth: 40, gradientColor: ringColor, dotColor: .blue, percentage: percentageCompletion, insetAmount: 20)
                .frame(width: 300, height: 300)
                .animation(.easeInOut, value: percentageCompletion)
        })
        .navigationTitle(activity.title)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(data: Activities(), activity: Activity.example)
            
    }
}
