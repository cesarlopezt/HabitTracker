//
//  HabitDetail.swift
//  HabitTracker
//
//  Created by Cesar Lopez on 3/27/23.
//

import SwiftUI

struct HabitDetail: View {
    var habit: Habit
    @ObservedObject var habitsManager: HabitsManager
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Count")
                    .foregroundColor(.secondary)
                HStack {
                    Spacer()
                    HStack {
                        Text(habit.count, format: .number)
                            .frame(width: 50, height: 50)
                            .background(.blue.opacity(0.2))
                            .clipShape(Circle())
                        
                        Button {
                            habitsManager.increaseCount(habit: habit)
                        } label: {
                            Image(systemName: "plus")
                                .frame(width: 30, height: 30)
                                .background(.green.opacity(0.2))
                                .clipShape(Circle())
                        }
                    }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(.secondary.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                    Spacer()
                }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.secondary.opacity(0.3))
                    .padding(.vertical)
                Text("Description")
                    .foregroundColor(.secondary)
                Text(habit.description)
                
                Spacer()
            }
            .padding()
            .navigationTitle(habit.title)
        }
    }
}

struct HabitDetail_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetail(habit: Habit(title: "Test Habit", description: "123 123 123"), habitsManager: HabitsManager())
    }
}
