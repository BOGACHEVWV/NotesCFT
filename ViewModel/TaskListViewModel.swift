//
//  TaskListViewModel.swift
//  NotesCFT
//
//  Created by mac on 03.10.2021.
//

import Foundation
import CoreData
 
class TaskListViewModel: ObservableObject {
    var title: String = ""
    var noteName: String = ""
    var noteText: String = ""
    var id: NSManagedObjectID = NSManagedObjectID()
    @Published var tasks: [TaskViewModel] = []
    
    @Published var changedNoteName = ""
    @Published var changedNoteText = ""
    
    func getAllTasks() {
        tasks = CoreDataManager.shared.getAllTasks().map(TaskViewModel.init)
    }
    
    func delete(_ task: TaskViewModel) {
        let existingTask = CoreDataManager.shared.getTaskById(id: task.id)
        if let existingTask = existingTask {
            CoreDataManager.shared.deleteTask(note: existingTask)
        }
    }
    
    func save() {
        let task = Note(context: CoreDataManager.shared.viewContext)
        task.title = title
        task.noteName = noteName
        task.noteText = noteText
        
        CoreDataManager.shared.save()
    }
}
struct TaskViewModel {
    let task: Note
    var id: NSManagedObjectID {
        return task.objectID 
    }

    var noteName: String {
        return task.noteName ?? "No name"
}
    var noteText: String {
        return task.noteText ?? "No text"
    }
   
    var title: String {
        return task.title ?? ""
    }
}
