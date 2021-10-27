//
//  DataManager.swift
//  NotesCFT
//
//  Created by mac on 05.10.2021.
//

import Foundation
import CoreData
import UIKit


class DataManager {

    static let shared = DataManager(moc: NSManagedObjectContext.current)
    
    var managedContext: NSManagedObjectContext
    private init (moc: NSManagedObjectContext) {
        self.managedContext = moc
    }
    
     // get notes
    func getNotes() -> [NoteEntity] {
        var notes = [NoteEntity]()
        let fetchRequest: NSFetchRequest<NoteEntity> = NoteEntity.fetchRequest()
        
        
        do {
            notes = try managedContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
        return notes
    }
    
    // save/new note
    func saveNote(id: UUID, name: String, text: String, date: Date) {
        let savedNote = NoteEntity(context: self.managedContext)
        savedNote.id = id
        savedNote.name = name
        savedNote.text = text
        savedNote.date = date
        do {
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
    // remove note
    func removeNote(id: UUID) {
        let fetchRequest: NSFetchRequest<NoteEntity> = NoteEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        do {
            let notes = try managedContext.fetch(fetchRequest)
            for note in notes {
                managedContext.delete(note)
            }
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
    // update note
    func updateNote(id: UUID, name: String, text: String, date: Date) {
        let fetchRequest: NSFetchRequest<NoteEntity> = NoteEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        do {
            let note = try managedContext.fetch(fetchRequest).first
            note?.name = name
            note?.text = text
            note?.date = date
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
}

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
         let persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "NoteModel")
            container.loadPersistentStores { (describtion, error) in
                if let error = error {
                    fatalError("Unable to initilize Core Date Stack \(error )")
                }
            }
            return container
        }()
        func saveContext() {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    context.rollback()
                    print(error.localizedDescription)
                }
            }
        }
        
        return persistentContainer.viewContext
    }
    
}


