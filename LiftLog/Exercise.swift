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
    var previousSets: [LiftSet] = [] // allows this to be optional during JSON decoding
    
    static let allExercises: [Exercise] = Bundle.main.decode("exercises.json")
}
