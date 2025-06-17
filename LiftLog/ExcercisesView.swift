//
//  ExcercisesView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import SwiftUI

struct ExcercisesView: View {
    let exercises: [Exercise] = Bundle.main.decode("exercises.json")
    
    @State private var searchText = ""
    var filteredExercises: [Exercise] {
        if searchText.isEmpty {
            exercises
        } else {
            exercises.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredExercises.sorted {$0.name < $1.name} ) { exercise in
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
}

#Preview {
    ExcercisesView()
}
