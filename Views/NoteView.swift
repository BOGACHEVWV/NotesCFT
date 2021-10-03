//
//  NoteView.swift
//  NotesCFT
//
//  Created by mac on 30.09.2021.
//

import SwiftUI

struct NoteView: View {
    
    @Environment(\.presentationMode) var noteViewPresentation
    @EnvironmentObject var noteListVM: NotesListViewModel
//    @State var noteViewModelState = NoteViewModel(note: Note())
    
    
//    @State var changedNoteName: String 
//    @State var changedNoteText: String
//    @State var id: NSManagedObjectID
//    @State var id: NSManagedObjectID
    
//    @State var note: Note
    
    
    var body: some View {
        // не должно быть константой
        Group {
            NoteDetails(name: $noteListVM.noteName, text: $noteListVM.noteText)
        }
        .onAppear() {
            
        }
        .navigationBarTitleDisplayMode(.inline)
//            .environmentObject(noteManager)
        .navigationBarItems(trailing: Button(action: { changeNote() }) {
            Image(systemName: "checkmark")
        })
    }
}

//struct NoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteView(id: UUID(), note: Note(id: UUID(), noteName: "", noteText: ""))
//    }
//}

extension NoteView {
    func changeNote() {
//        noteListVM.updateNote(name: changedNoteName, text: changedNoteText)
        
        noteViewPresentation.wrappedValue.dismiss()
    }
}
