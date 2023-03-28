//
//  AddHabit.swift
//  HabitTracker
//
//  Created by Cesar Lopez on 3/26/23.
//

import SwiftUI

struct AddHabit: View {
    @ObservedObject var habitsManager: HabitsManager;
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                        .padding(.bottom, 60)
                }
                
            }
            .navigationTitle("New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        habitsManager.addHabit(title: title, description: description)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habitsManager: HabitsManager())
    }
}
