//
//  Exercise.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import Foundation

struct Exercise: Identifiable, Codable {
    var id = UUID()
    let name: String
    var bodyPart: String
    let category: String
}
