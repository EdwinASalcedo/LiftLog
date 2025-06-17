//
//  Template.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import Foundation

struct Template: Codable, Identifiable, Hashable {
    var id: String
    var name: String
    var exercises: [Exercise]
    var lastUsed: Date?
    
    static let example: Template = .init(
        id: "push-day",
        name: "Push Day",
        exercises: [Exercise.allExercises[0], Exercise.allExercises[9], Exercise.allExercises[10], Exercise.allExercises[15], Exercise.allExercises[36]],
        lastUsed: nil
    )
    static let example2: Template = .init(
        id: "leg-day",
        name: "Leg Day",
        exercises: [Exercise.allExercises[1], Exercise.allExercises[2], Exercise.allExercises[18], Exercise.allExercises[19], Exercise.allExercises[35]],
        lastUsed: nil
    )
}
