//
//  WorkoutView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/17/25.
//

import SwiftUI

struct WorkoutView: View {
    let template: Template
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "calendar")
                        Text("June 17, 2025")
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                        Text("Time elapsed")
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    ForEach(template.exercises) { exercise in
                        HStack {
                            Text(exercise.name)
                                .foregroundStyle(.blue)
                                .bold(true)
                            Spacer()
                            Button() {
                                
                            } label: {
                                Image(systemName: "ellipsis")
                            }
                            .buttonStyle(.bordered)
                            .tint(.blue)
                        }
                        .padding(.bottom)
                        
                        HStack {
                            Text("Set")
                            Spacer()
                            Text("Previous")
                            Spacer()
                            Text("lbs")
                            Spacer()
                            Text("Reps")
                            Spacer()
                            Image(systemName: "checkmark")
                                .padding(.trailing)
                        }
                        
                        LazyVStack {
                            SetRowView()
                        }
                        
                        Button(action: addSet) {
                            Text("+ Add Set (Rest Timer)")
                                .bold(true)
                                .frame(maxWidth: .infinity)
                        }
                        .foregroundStyle(.primary)
                        .controlSize(.small)
                        .buttonStyle(.bordered)
                        .padding(.bottom)
                    }
                    
                    Button(action: addExercise) {
                        Text("Add Exercise")
                            .bold(true)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .padding(.vertical)

                    Button(action: addExercise) {
                        Text("Cancel Workout")
                            .bold(true)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .tint(.red)
                    .padding(.vertical)
                }
                .toolbar() {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Finish") {
                            // code to finish workout
                        }
                        .bold(true)
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                    }
                }
            }
            .navigationTitle(template.name)
            .padding([.bottom, .horizontal])
        }
    }
    
    // Functions
    func addExercise() {
        print("add Exercise Function")
    }
    
    func addSet() {
        print("add Set Function")
    }
}

#Preview {
    WorkoutView(template: Template.example)
}
