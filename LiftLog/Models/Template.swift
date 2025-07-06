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
        exercises: [.allExercises[0], .allExercises[9], .allExercises[10], .allExercises[15], .allExercises[36]],
        lastUsed: Date()
    )
    static let example2: Template = .init(
        id: "leg-day",
        name: "Leg Day",
        exercises: [.allExercises[1], .allExercises[2], .allExercises[18], .allExercises[19], .allExercises[35]],
        lastUsed: Date()
    )
    static let emptyTemplate: Template = .init(
        id: "",
        name: "New Workout",
        exercises: [],
        lastUsed: Date()
    )
}
