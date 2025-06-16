//
//  Template.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import Foundation

struct Template: Codable, Identifiable {
    var id = UUID()
    var exercise: [Exercise]
    
}
