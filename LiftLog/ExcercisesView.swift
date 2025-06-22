//
//  ExcercisesView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import SwiftUI

struct ExcercisesView: View {
    /* Start of properties */
    let exercises: [Exercise] = Bundle.main.decode("exercises.json")
    
    @State private var selectedBodyPart: String = "Any Body Part"
    @State private var selectedCategory: String = "Any Category"
    @State private var searchText = ""
    
    let bodyParts = ["Any Body Part", "Core", "Chest", "Back", "Shoulders", "Arms", "Legs", "Other", "Olympic", "Full Body", "Cardio"]
    let categories = ["Any Category", "Barbell", "Dumbbell", "Machine / Other", "Weighted Bodyweight", "Assisted Bodyweight", "Reps Only", "Cardio", "Duration"]
    
    var filteredExercises: [Exercise] {
//        if searchText.isEmpty {
//            exercises
//        } else {
//            exercises.filter { $0.name.localizedStandardContains(searchText) }
//        }
        exercises.filter { exercise in
            (selectedBodyPart == "Any Body Part" || exercise.bodyPart == selectedBodyPart) &&
            (selectedCategory == "Any Category" || exercise.category == selectedCategory) &&
            (searchText.isEmpty || exercise.name.localizedStandardContains(searchText))
        }
    }
    
    /* End of properties / Start of View */
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Fixed filter buttons under the search bar
                HStack {
                    Menu {
                        ForEach(bodyParts, id: \.self) { part in
                            Button(part) {
                                selectedBodyPart = part
                            }
                        }
                    } label: {
                        Text(selectedBodyPart)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.black)
                            .bold(true)
                    }
                    .buttonStyle(.bordered)
                    
                    Menu {
                        ForEach(categories, id: \.self) { category in
                            Button(category) {
                                selectedCategory = category
                            }
                        }
                    } label: {
                        Text(selectedCategory)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.black)
                            .bold(true)
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
                
                // Scrollable exercise list
                List(filteredExercises.sorted(by: { $0.name < $1.name })) { exercise in
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text(exercise.name)
                            Text(exercise.bodyPart)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Exercises")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("New") {
                        // code to add new exercise
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button() {
                        // code to show archived exercises
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }            
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
        }
    }
    
    /* End of View / Start of Functions */
    
    /* End of Functions */
}

#Preview {
    ExcercisesView()
}
