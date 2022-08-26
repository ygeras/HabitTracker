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
        GeometryReader { geometry in
            ZStack {
                List {
                    Section {
                        if activity.description.isEmpty == false {
                            Text(activity.description)
                        }
                    } header: {
                        Text("Description")
                    }
                    
                    Section {
                        Text("Completion count: \(activity.completionCount)")
                        HStack {
                            Text("Your target: \(activity.target)")
                            Spacer()
                            Image(systemName: "hand.tap")
                        }
                        .contextMenu {
//                            Button {
//                                // code goes here
//                            } label: {
//                                Text("Edit target")
//                                Image(systemName: "square.and.pencil")
//                            }
                        }
                    } header: {
                        Text("Statistics")
                    }
                }
                .overlay(alignment: .bottom) {
                    VStack(spacing: 40) {
                        Ring(lineWidth: 40, gradientColor: ringColor, dotColor: .blue, percentage: percentageCompletion, insetAmount: 0)
                            .animation(.easeInOut, value: percentageCompletion)
                            .frame(width: geometry.size.width / 1.3, height: geometry.size.width / 1.3)
                            .overlay {
                                Text(percentageCompletion, format: .percent)
                                    .font(.title2).fontWeight(.light)
                            }
                        
                        Button(action: {
                            var newActivity = activity
                            newActivity.completionCount += 1
                            
                            if let index = data.activities.firstIndex(of: activity) {
                                data.activities[index] = newActivity
                            }
                        }, label: {
                            Text("Mark completed")
                        })
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue.opacity(0.9))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                }
                .navigationTitle(activity.title)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(data: Activities(), activity: Activity.example)
            
            
            
            
            
    }
}
