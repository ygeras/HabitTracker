//
//  ContentView.swift
//  HabitTracker
//
//  Created by Yuri Gerasimchuk on 04.06.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = Activities()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.activities) { activity in
                    NavigationLink {
                        ActivityView(data: data, activity: activity)
                    } label: {
                        HStack {
                            Text(activity.title)
                            Spacer()
                            Text(String(activity.completionCount))
                                .font(.caption.weight(.black))
                                .foregroundColor(.white)
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: activity))
                                .clipShape(Capsule())
                        }
                    }
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("HabitTracker")
            .toolbar {
                Button {
                    addingNewActivity.toggle()
                } label: {
                    Label("Add new activity", systemImage: "plus")
                }
            }
            .sheet(isPresented: $addingNewActivity) {
                AddActivity(data: data)
            }
        }
    }
    
    func color(for activity: Activity) -> Color {
        switch activity.completionCount {
        case ..<3:
            return .red
        case ..<10:
            return .orange
        case ..<20:
            return .green
        case ..<50:
            return .blue
        default:
            return .indigo
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        data.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
