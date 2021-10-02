//
//  NoteManager.swift
//  NotesCFT
//
//  Created by mac on 29.09.2021.
//

import SwiftUI
import Combine

struct Note: Identifiable, Codable {
    var id = UUID()
    var noteName: String
    var text: String
}

class NoteManager: ObservableObject {
    @Published var notes = [Note(id: UUID(), noteName: "Test name", text: "Test note")]
    @Published var changedNoteName = ""
    @Published var changedNoteText = ""
}


