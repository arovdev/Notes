//
//  Note.swift
//  Notes Watch App
//
//  Created by Arthur Reshetnyak on 2024-05-03.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
