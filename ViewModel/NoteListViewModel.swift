//
//  NoteListViewModel.swift
//  NotesCFT
//
//  Created by mac on 12.10.2021.
//

import Foundation
import SwiftUI
import Combine

class NoteListViewModel: ObservableObject {
    @Published var notes = [NoteViewModel]()
    
    func fetchAllNotes() {
        self.notes = DataManager.shared.getNotes().map(NoteViewModel.init).sorted(by: {$0.date > $1.date})
        
    }
    
    func removeNote(at index: Int) {
        let note = notes[index]
        DataManager.shared.removeNote(id: note.id)
    }
    
    
}
