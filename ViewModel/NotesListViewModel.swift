//
//  NoteListViewModel.swift
//  NotesCFT
//
//  Created by mac on 03.10.2021.
//

import Foundation
import CoreData
 
class NotesListViewModel: ObservableObject {
    var title: String = ""
    var noteName: String = ""
    var noteText: String = ""
    var id: NSManagedObjectID = NSManagedObjectID()
    @Published var notes: [NoteViewModel] = []
    
    @Published var changedNoteName = ""
    @Published var changedNoteText = ""
    
    func getAllNotes() {
        notes = CoreDataManager.shared.getAllNotes().map(NoteViewModel.init)
    }
    
    func delete(_ note: NoteViewModel) {
        let existingNote = CoreDataManager.shared.getNoteById(id: note.id)
        if let existingNote = existingNote {
            CoreDataManager.shared.deleteNote(note: existingNote)
        }
    }
//    func update(_ note: NoteViewModel) {
//        let existingNote = CoreDataManager.shared.getNoteById(id: note.id)
//        if let existingNote = existingNote {
//            existingNote.noteName = noteName
//            existingNote.noteText = noteText
//
//            save()
//        }
//    }
//
    
    func update(noteViewState: NoteViewModel) {
        
        do {
            try CoreDataManager.shared.updatePost(noteId: noteViewState.id, noteName: noteViewState.noteName, noteText: noteViewState.noteText)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func save() {
        let note = Note(context: CoreDataManager.shared.viewContext)
//        note.title = title
        note.noteName = noteName
        note.noteText = noteText
        
        CoreDataManager.shared.save()
    }
    
//    func updateNote(name: String, text: String) {
//        let request:NSFetchRequest<Note> = Note.fetchRequest()
//        do {
//            let changedNote = try CoreDataManager.shared.viewContext.fetch(request).first
//            changedNote?.noteName = name
//            changedNote?.noteText = text
//            try CoreDataManager.shared.viewContext.save()
//        } catch {
//            print("update error \(error)")
//        }
//    }
    
}
struct NoteViewModel {
    let note: Note
    var id: NSManagedObjectID {
        return note.objectID 
    }

    var noteName: String {
        return note.noteName ?? "No name"
}
    var noteText: String {
        return note.noteText ?? "No text"
    }
   
    var title: String {
        return note.title ?? ""
    }
}
