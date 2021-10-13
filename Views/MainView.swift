//
//  MainView.swift
//  NotesCFT
//
//  Created by mac on 26.09.2021.
//

import SwiftUI
import Combine

struct MainView: View {
    @ObservedObject var noteVM = NoteListViewModel()
    @State private var addNewPresented = false
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(noteVM.notes.indices, id: \.self) { index in
                        // ZStack и .hidden нужны, чтобы убрать срелку справа (шеврон появляется при добавлении NavigationLink в List/ForEach).
                        ZStack(alignment: .leading) {
                            NoteCell(noteVM: noteVM.notes[index])
                            NavigationLink(destination: UpdateNoteView(noteVM: noteVM.notes[index])) {
                            }
                            
                            .hidden()
                        }
                    }
                    .onDelete(perform:delete(at:))
                }
            }
            .onAppear() {
                refreshData()
            }
            .navigationTitle("Заметки")
            .navigationBarItems(trailing: NavigationLink(
                destination: NewNoteView().onDisappear(){noteVM.fetchAllNotes()})
            {
                Image(systemName: "plus")
                    .font(.title)
            })
        }       
        // На данный момент в SwiftUI нет возможно изменить цвет NavigationBar'а(или я не нашел), когда он не inline. Данный костыль помогает справиться с этой задачей.
        .navigationAppearance(backgroundColor: .systemRed, foregroundColor: .systemBackground, tintColor: .systemBackground, hideSeparator: true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            noteVM.removeNote(at: index)
        }
        refreshData()
    }
    
    func refreshData() {
        noteVM.fetchAllNotes()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
