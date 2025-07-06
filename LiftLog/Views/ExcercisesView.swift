//
//  ExcercisesView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import SwiftUI

struct ExerciseThumbnail: View {
    let exercise: Exercise

    var body: some View {
        if let imageName = exercise.imageName,
           let uiImage = UIImage(named: imageName) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray.opacity(0.4), lineWidth: 1))
        } else {
            ZStack {
                Text(String(exercise.name.prefix(1)).uppercased())
                    .font(.headline)
            }
        }
    }
}

struct ExcercisesView: View {
    /* Start of properties */
    @State private var exercises: [Exercise] = Bundle.main.decode("exercises.json")
    @State private var userExercises: [Exercise] = ExerciseStore.shared.load()
    
    @State private var selectedBodyPart = "Any Body Part"
    @State private var selectedCategory = "Any Category"
    @State private var searchText = ""
    @State private var showAddExercise = false
    
    let bodyParts = ["Any Body Part", "Core", "Chest", "Back", "Shoulders", "Arms", "Legs", "Other", "Olympic", "Full Body", "Cardio"]
    let categories = ["Any Category", "Barbell", "Dumbbell", "Machine / Other", "Weighted Bodyweight", "Assisted Bodyweight", "Reps Only", "Cardio", "Duration"]
    
    var filteredExercises: [Exercise] {
        let allExercises = exercises + userExercises
        
        return allExercises.filter { exercise in
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
//                        Image(systemName: "questionmark.circle")
//                            .padding(.horizontal)
                        ExerciseThumbnail(exercise: exercise)
                            .frame(width: 40, height: 40)
                        
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
                        showAddExercise = true
                    }
                    .sheet(isPresented: $showAddExercise) {
                        AddExerciseView(userExercises: $userExercises)
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
