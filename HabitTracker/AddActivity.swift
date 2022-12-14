//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Yuri Gerasimchuk on 04.06.2022.
//

import SwiftUI

struct AddActivity: View {
    @ObservedObject var data: Activities
    @State private var title = ""
    @State private var description = ""
    @State private var target = 0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 20) {
                    Group {
                        TextField("Title", text: $title)
                        TextField("Description", text: $description)
                        TextField("Target", value: $target, format: .number)
                            .foregroundColor(.gray)
                            .keyboardType(.numberPad)
                    }
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                }
                .padding(20)
                .background(Color.blue.opacity(0.9))
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding(20)
                
                Spacer()
            }
            .navigationTitle("Add Activity")
            .toolbar {
                Button("Save") {
                    let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                    guard trimmedTitle.isEmpty == false else { return }
                    
                    let activity = Activity(title: trimmedTitle, description: description, target: target)
                    data.activities.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(data: Activities())
            
            
            
            
            
    }
}
