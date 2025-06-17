//
//  Exercise.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import Foundation

struct Exercise: Identifiable, Codable, Hashable {
    var id: String
    var name: String
    var bodyPart: String
    var category: String
    
    static let allExercises: [Exercise] = Bundle.main.decode("exercises.json")
    
    static let example = Exercise(
        id: "bench-press",
        name: "Bench Press",
        bodyPart: "Chest",
        category: "Barbell"
    )
    
    static let example2 = Exercise(
        id: "squat",
        name: "Squat",
        bodyPart: "Legs",
        category: "Barbell"
    )
}
