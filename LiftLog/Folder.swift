//
//  Folder.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/16/25.
//

import Foundation

struct Folder: Codable, Identifiable {
    var id = UUID()
    var templates: [Template]
}
