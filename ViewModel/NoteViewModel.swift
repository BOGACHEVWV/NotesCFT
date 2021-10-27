//
//  NoteViewModel.swift
//  NotesCFT
//
//  Created by mac on 12.10.2021.
//

import Foundation
import SwiftUI
import Combine

class NoteViewModel {
    var id: UUID
    var name: String
    var text: String
    var date: Date

    var dateFormatter: DateFormatter = {
        let d = DateFormatter()
        d.dateStyle = .short
        d.dateFormat = "MM-dd-yyyy HH:mm"
        return d
    }()
    
    var dateString: String {
        return dateFormatter.string(from: date)
    }
    
    init(id: UUID, name: String, text: String, date: Date) {
        self.id = id
        self.name = name
        self.text = text
        self.date = date
    }
    init(note: NoteEntity) {
        self.id = note.id ?? UUID()
        self.name = note.name ?? "Not found"
        self.text = note.text ?? "Not found"
        self.date = note.date ?? Date()
    }
    
}
