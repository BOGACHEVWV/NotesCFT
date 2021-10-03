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
    @ObservedObject private var taskListVM = TaskListViewModel()
    
    func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = taskListVM.tasks[index]
            taskListVM.delete(task)
        }
        taskListVM.getAllTasks()
    }
    
    @State var newNoteText: String = ""
    
    var body: some View {
        NavigationView  {
            VStack {
                List {
                    ForEach(taskListVM.tasks, id: \.id) { note in
                        // ZStack и .hidden нужны, чтобы убрать срелку справа (шеврон появляется при добавлении NavigationLink в List/ForEach).
                        ZStack {
//                            HStack {
//                                Text("\(note.noteName)")
//                                Spacer()
//                                Text("\(taskListVM.noteText)")
//                            }
                            NoteCell(name: note.noteName, text: note.noteName)
                            NavigationLink(destination: NoteView()) {
                            }
                            .hidden()
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
            }
            .navigationTitle("Заметки")
            .navigationBarItems(trailing: NavigationLink(destination: NewNoteView()) {
                Image(systemName: "plus")
                    .font(.title)
            })
        }
        .environmentObject(taskListVM)
        .onAppear() {
            taskListVM.getAllTasks()
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
