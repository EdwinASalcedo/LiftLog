//
//  Set.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/18/25.
//

import Foundation

struct LiftSet: Hashable, Codable, Identifiable {
    var id = UUID()
    var reps: Int
    var weight: Double
    
    // Tells swift that these keys are the only ones that should be decode from JSON
    // and everything else I will manually handle such as id key
    enum CodingKeys: String, CodingKey {
        case reps
        case weight
    }
    
    static let example: LiftSet = .init(reps: 0, weight: 0.0)
}
