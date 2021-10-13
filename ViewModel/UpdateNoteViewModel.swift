//
//  UpdateNoteViewModel.swift
//  NotesCFT
//
//  Created by mac on 13.10.2021.
//

import SwiftUI

class UpdateNoteViewModel {
    func updateNote(note: NoteViewModel) {
        DataManager.shared.updateNote(id: note.id, name: note.name, text: note.text, date: note.date)
    }
}


