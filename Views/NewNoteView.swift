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
    
    @State private var selectedTag = 0
        
    var body: some View {
        
        Group {
            
                VStack(alignment: .leading) {
                   
//                        Picker("", selection: $selectedTag) {
//                          Text("title").tag(0)
//                            Text("footnote").tag(1)
//                        }
//                        .pickerStyle(SegmentedPickerStyle())
//                        .padding()
                    TextField("Название", text: $newNoteData.name)
                        .font(.title)
                        .minimumScaleFactor(0.6) 
               
                Divider()
                TextEditor( text:$newNoteData.text)
                    .font(textStyle())
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
//            Image(systemName: "checkmark")
            Text("Создать")
                .foregroundColor(.white)
//                .font(Font.title.weight(.medium))
//                .font(.title2)
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

extension NewNoteView {
    func textStyle() -> Font {
        var textFont: Font = .title
        switch selectedTag {
        case 0: textFont = .title
        case 1: textFont = .footnote
        default:
            break
        }
        return textFont
    }
    
}

