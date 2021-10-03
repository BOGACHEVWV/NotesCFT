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
    
    func getTaskById(id:NSManagedObjectID) -> Note? {
        do {
        return try viewContext.existingObject(with: id) as? Note
        } catch {
            return nil
        }
    }
    
    func deleteTask(note: Note) {
        viewContext.delete(note)
        save()
    }
    
    func getAllTasks() -> [Note] {
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
    
    let persistantContainer: NSPersistentContainer
    private  init() {
        persistantContainer = NSPersistentContainer(name: "TodoAppModel")
        persistantContainer.loadPersistentStores { (describtion, error) in
            if let error = error {
                fatalError("Unable to initilize Core Date Stack \(error )")
            }
        }
    }
}

