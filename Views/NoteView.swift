//
//  NoteView.swift
//  NotesCFT
//
//  Created by mac on 30.09.2021.
//

import SwiftUI

struct NoteView: View {
    
    @Environment(\.presentationMode) var noteViewPresentation
    
    @EnvironmentObject var noteManager: NoteManager
    
//    @State var changedNoteName = ""
//    @State var changedNoteText = ""
    @State var id: UUID
    
    @State var note: Note
    
    
    var body: some View {
        // не должно быть константой
        Group {
            NoteDetails(name: $noteManager.changedNoteName, text: $noteManager.changedNoteText)

        }
        .onAppear() {
            noteManager.changedNoteName = note.noteName
            noteManager.changedNoteText = note.text
        }
        .navigationTitle("\(noteManager.changedNoteName)")
        .navigationBarTitleDisplayMode(.inline)
//            .environmentObject(noteManager)
        .navigationBarItems(trailing: Button(action: {noteViewPresentation.wrappedValue.dismiss(); print("noteName: \(noteManager.changedNoteName) noteText: \(noteManager.changedNoteText)"); changeNote()}) {
            Image(systemName: "checkmark")
        })
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(id: UUID(), note: Note(id: UUID(), noteName: "", text: ""))
    }
}

extension NoteView {
    func changeNote() {
       
        if let row = self.noteManager.notes.firstIndex(where: {$0.id == id}) {
            noteManager.notes[row] = Note(noteName: noteManager.changedNoteName, text: noteManager.changedNoteText)
//            noteManager.notes[row].noteName = noteManager.changedNoteName
//            noteManager.notes[row].text = noteManager.changedNoteText
//            noteManager.notes.remove(at: row)
//            note.noteName = noteManager.changedNoteName
//            note.text = noteManager.changedNoteText
        }
        
        

        
//        noteManager.notes.append(Note(id: UUID(), noteName: changedNoteName == "" ? note.noteName : note.noteName, text: note.text))
//        
        noteViewPresentation.wrappedValue.dismiss()
        print(noteManager.notes)
    }
        
    
}
