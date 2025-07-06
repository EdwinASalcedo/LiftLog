//
//  WorkoutView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/17/25.
//

import SwiftUI

struct WorkoutView: View {
    // Pass in template or template.empty
    let template: Template
    // copy the exercises to local var so that they can be editable
    @State private var exercises: [Exercise]
    
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
                    
                    ForEach(exercises.indices, id: \.self) { exerciseIndex in
                        let exercise = exercises[exerciseIndex]
                        
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
                        
                        ForEach(Array(zip(exercise.previousSets.indices, exercise.previousSets)), id: \.1.id) { index, _ in
                            LazyVStack {
                                SetRowView(set: $exercises[exerciseIndex].previousSets[index], setNumber: index + 1)
                            }
                        }
                        
                        Button {
                            addSet(to: exerciseIndex)
                        } label: {
                            Text("+ Add Set (Rest Timer)")
                                .bold(true)
                                .frame(maxWidth: .infinity)
                        }
                        .foregroundStyle(.primary)
                        .controlSize(.small)
                        .buttonStyle(.bordered)
                        .padding(.bottom)
                    }
                    
                    
                    Spacer()
                    
                    
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
    
    // in order to actually make any changes to the template and the other structs
    // we must have copies of them and then later use a save function to make changes to
    // the template itslef
    init(template: Template) {
        self.template = template
        _exercises = State(initialValue: template.exercises)
    }
    
    func addExercise() {
        print("add Exercise Function")
    }
    
    func addSet(to exerciseIndex: Int) {
        print("add Set Function")
        let newSet = LiftSet(reps: 0, weight: 0.0)
        exercises[exerciseIndex].previousSets.append(newSet)
    }
}

#Preview {
    WorkoutView(template: Template.example)
}
