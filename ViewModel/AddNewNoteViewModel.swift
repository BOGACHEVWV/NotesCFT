//
//  AddNewViewModel.swift
//  NotesCFT
//
//  Created by mac on 13.10.2021.
//

import SwiftUI

class AddNewNoteViewModel {
    func saveNote(note: NoteViewModel) {
        DataManager.shared.saveNote(id: note.id, name: note.name, text: note.text, date: note.date)
    }
}
 
