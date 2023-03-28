//
//  Habit.swift
//  HabitTracker
//
//  Created by Cesar Lopez on 3/26/23.
//

import Foundation

struct Habit: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var count: Int = 0
}
