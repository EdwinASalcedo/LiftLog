//
//  Folder.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/16/25.
//

import Foundation

struct Folder: Codable, Identifiable, Hashable {
    var id: String
    var name: String
    var templates: [Template]
    var numberOfTemplates: Int { templates.count }
    
    static let example: Folder = .init(
        id: "my-templates",
        name: "My Templates",
        templates: [Template.example, Template.example2]
    )
}
