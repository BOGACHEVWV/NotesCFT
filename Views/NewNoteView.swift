//
//  NoteView.swift
//  NotesCFT
//
//  Created by mac on 28.09.2021.
//

import SwiftUI

class AddNewNoteData: ObservableObject {
    @Published var name: String = ""
    @Published var text: String = ""
    @Published var date: Date = Date()
}

struct NewNoteView: View {
    @Environment(\.presentationMode) var newNoteViewPresentation
    @ObservedObject var newNoteData = AddNewNoteData()
    private let viewModel = AddNewNoteViewModel() 
        
    var body: some View {
        
        Group {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading) {
                    TextField("Note name", text: $newNoteData.name)
                        .font(.title)
                        .minimumScaleFactor(0.6) 
                }
                Divider()
                TextEditor( text:$newNoteData.text)
                Spacer()
            }
            .padding()
        }
        .onTapGesture {
            DismissKeyboardHelper.dismissKeyboard()
        }
        .navigationBarTitleDisplayMode(.inline)
        //            .environmentObject(noteManager)
        .navigationBarItems(trailing: Button(action: {addNewNote()}) {
            Image(systemName: "checkmark")
        })
    }
    
    func addNewNote() {
        let note = NoteViewModel(id: UUID(), name: newNoteData.name, text: newNoteData.text, date: newNoteData.date)
        viewModel.saveNote(note: note)
        newNoteViewPresentation.wrappedValue.dismiss()
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
        
    }
}



