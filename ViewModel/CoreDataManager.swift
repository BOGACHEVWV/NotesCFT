//
//  CoreDataManager.swift
//  NotesCFT
//
//  Created by mac on 03.10.2021.
//

import Foundation
import CoreData

class CoreDataManager {
    
     static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistantContainer.viewContext
    }
    
    func getNoteById(id:NSManagedObjectID) -> Note? {
        do {
        return try viewContext.existingObject(with: id) as? Note
        } catch {
            return nil
        }
    }
    
    func deleteNote(note: Note) {
        viewContext.delete(note)
        save()
    }
    
    func updatePost(noteId: NSManagedObjectID, noteName: String, noteText: String) throws {
        
        let existingNote = CoreDataManager.shared.getNoteById(id: noteId)
        
        if let existingNote = existingNote {
            existingNote.noteName = noteName
            existingNote.noteText = noteText
            save()
        }
        
    }
    
    func updateNote(_ note: NoteViewModel, noteName: String, noteText: String) {
            let existingNote = CoreDataManager.shared.getNoteById(id: note.id)
            if let existingNote = existingNote {
                existingNote.noteName = noteName
                existingNote.noteText = noteText
                save()
            }
        }
    
    
    func getAllNotes() -> [Note] {
        let request:NSFetchRequest<Note> = Note.fetchRequest()
        do {
        return try viewContext.fetch(request)
        } catch {
          return  []
        }
    }
    
    func save() {
        do {
        try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
//    func updateNote(name: String, text: String) {
//        let request:NSFetchRequest<Note> = Note.fetchRequest()
//            do {
//                let changedNote = try CoreDataManager.shared.viewContext.fetch(request).first
//                changedNote?.noteName = name
//                changedNote?.noteText = text
//                try viewContext.save()
//            } catch {
//                print("update error \(error)")
//            }
//            
//        }
    
    let persistantContainer: NSPersistentContainer
    private  init() {
        persistantContainer = NSPersistentContainer(name: "NotesAppModel")
        persistantContainer.loadPersistentStores { (describtion, error) in
            if let error = error {
                fatalError("Unable to initilize Core Date Stack \(error )")
            }
        }
    }
}

