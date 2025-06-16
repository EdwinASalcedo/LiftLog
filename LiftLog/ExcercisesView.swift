//
//  ExcercisesView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import SwiftUI

struct ExcercisesView: View {
    let testData = [
        Exercise(name: "Bench Press", bodyPart: "Chest", category: "Barbell"),
        Exercise(name: "Squat", bodyPart: "Legs", category: "Barbell"),
        Exercise(name: "Shoulder Press", bodyPart: "Shoulders", category: "Dumbbell"),
    ]
    
    @State private var searchText = ""
    var filteredExercises: [Exercise] {
        if searchText.isEmpty {
            testData
        } else {
            testData.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List(testData) { exercise in
                HStack {
                    Image(systemName: "questionmark.circle")
                        .padding(.horizontal)
                    
                    VStack {
                        Text(exercise.name)
                        Text(exercise.bodyPart)
                    }
                }
            }
            .navigationTitle("Exercises")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Text("New")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "ellipsis")
                }
            }
            .searchable(text: $searchText, prompt: "Search")
        }
        
    }
}

#Preview {
    ExcercisesView()
}
