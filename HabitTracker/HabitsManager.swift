//
//  HabitsManager.swift
//  HabitTracker
//
//  Created by Cesar Lopez on 3/26/23.
//

import Foundation

class HabitsManager: ObservableObject {
    private let key = "habits"
    
    @Published var habits = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
    
    func addHabit(title: String, description: String) {
        let newHabit = Habit(title: title, description: description)
        habits.append(newHabit)
    }
    
    func increaseCount(habit: Habit) {
        if let index = habits.firstIndex(where: { h in habit == h }) {
            var newHabit = habit
            newHabit.count += 1
            habits[index] = newHabit
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: key) {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                habits = decodedItems
                return
            }
        }
        habits = []
    }
}
