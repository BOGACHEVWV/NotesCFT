//
//  NoteView.swift
//  NotesCFT
//
//  Created by mac on 30.09.2021.
//

import SwiftUI

class UpdateNoteData: ObservableObject {
    @Published var name: String = ""
    @Published var text: String = ""
    @Published var date: Date = Date()
    @Published var id: UUID = UUID()
}


struct UpdateNoteView: View {
    
    @Environment(\.presentationMode) var updateNoteViewPresentation
    @ObservedObject var updatedNoteData = UpdateNoteData()
    private let viewModel = UpdateNoteViewModel()

    init(noteVM: NoteViewModel) {
        updatedNoteData.id = noteVM.id
        updatedNoteData.name = noteVM.name
        updatedNoteData.text = noteVM.text
    }
    
    var body: some View {
        Group {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading) {
                    TextField("Note name", text: $updatedNoteData.name)
                        .font(.title)
                        .minimumScaleFactor(0.6)
                }
                Divider()
                TextEditor( text: $updatedNoteData.text)
                Spacer()
            }
            .padding()
        }
        .onAppear() {
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: { updateNote() }) {
//            Image(systemName: "checkmark"
            Text("Сохранить")
                .foregroundColor(.white)
        })
    }
    
    private func updateNote() {
        let note = NoteViewModel(id: updatedNoteData.id, name: updatedNoteData.name, text: updatedNoteData.text, date: updatedNoteData.date)
        viewModel.updateNote(note: note)
        updateNoteViewPresentation.wrappedValue.dismiss()
    }
    
}


