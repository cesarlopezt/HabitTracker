//
//  ContentView.swift
//  HabitTracker
//
//  Created by Cesar Lopez on 3/26/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habitsManager = HabitsManager()
    
    @State private var showingAdd = false
    
    var body: some View {
        NavigationView {
            VStack {
                if (habitsManager.habits.isEmpty) {
                    List {
                        Text("Add your first habit!")
                    }
                } else {
                    List {
                        ForEach(habitsManager.habits) { habit in
                            NavigationLink {
                                HabitDetail(habit: habit, habitsManager: habitsManager)
                            } label: {
                                HStack {
                                    Text(habit.title)
                                    Spacer()
                                    Text(habit.count, format: .number)
                                        .padding(10)
                                        .background(.blue.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                Button {
                    showingAdd = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("My Habits")
            .sheet(isPresented: $showingAdd) {
                AddHabit(habitsManager: habitsManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
