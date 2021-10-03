//
//  NoteView.swift
//  NotesCFT
//
//  Created by mac on 28.09.2021.
//

import SwiftUI

struct NewNoteView: View {
    
    @Environment(\.presentationMode) var newNoteViewPresentation
    
    @EnvironmentObject var taskListVM: TaskListViewModel
    
    
    @State var newNoteName = ""
    @State var newNoteText = ""
    var body: some View {
      
        Group {
            NoteDetails(name: $taskListVM.noteName, text: $taskListVM.noteText)
        }
        
            .navigationTitle("\(newNoteName)")
            .navigationBarTitleDisplayMode(.inline)
//            .environmentObject(noteManager)
            .navigationBarItems(trailing: Button(action: {addNote()}) {
                Image(systemName: "checkmark")
            }
//            .disabled(newNoteText == "" ? true : false)
            )
            
    }

}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
            
    }
}

extension NewNoteView {
     func addNote() {
//        noteManager.notes.append(Note(id: UUID(), noteName: newNoteName == "" ? newNoteText : newNoteName, noteText: newNoteText))
        taskListVM.save()
        taskListVM.getAllTasks()

        newNoteViewPresentation.wrappedValue.dismiss()
        print(taskListVM.tasks)
    }
}


