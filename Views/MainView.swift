//
//  MainView.swift
//  NotesCFT
//
//  Created by mac on 26.09.2021.
//

import SwiftUI
import Combine

struct MainView: View {
    
//    @EnvironmentObject var noteManager: NoteManager
//    @ObservedObject var noteManager = NoteManager()
    @ObservedObject private var noteListVM = NotesListViewModel()
    
    func deleteNote(at offsets: IndexSet) {
        offsets.forEach { index in
            let note = noteListVM.notes[index]
            noteListVM.delete(note)
        }
        noteListVM.getAllNotes()
    }
    
    @State var newNoteText: String = ""
    
    var body: some View {
        NavigationView  {
            VStack {
                List {
                    ForEach(noteListVM.notes, id: \.id) { note in
                        // ZStack и .hidden нужны, чтобы убрать срелку справа (шеврон появляется при добавлении NavigationLink в List/ForEach).
                        ZStack {
                            NoteCell(name: note.noteName, text: note.noteName)
                            NavigationLink(destination: NoteView()) {
                            }
                            .hidden()
                        }
                    }
                    .onDelete(perform: deleteNote)
                }
            }
            .navigationTitle("Заметки")
            .navigationBarItems(trailing: NavigationLink(destination: NewNoteView()) {
                Image(systemName: "plus")
                    .font(.title)
            })
        }
        .environmentObject(noteListVM)
        .onAppear() {
            noteListVM.getAllNotes()
        }
        // На данный момент в SwiftUI нет возможно изменить цвет NavigationBar'а(или я не нашел), когда он не inline. Данный костыль помогает справиться с этой задачей.
        .navigationAppearance(backgroundColor: .systemRed, foregroundColor: .systemBackground, tintColor: .systemBackground, hideSeparator: true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
//extension MainView {
//    func delete(indexSet: IndexSet) {
//        noteManager.notes.remove(atOffsets: indexSet)
//    }
//}
