//
//  NoteDetails.swift
//  NotesCFT
//
//  Created by mac on 30.09.2021.
//

import SwiftUI

struct NoteDetails: View {
    @Binding var name: String
    @Binding var text: String
    var id: UUID?
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                TextField("Note name", text: $name)
                    .font(.title)
                    .minimumScaleFactor(0.6)
                HStack {
                    Text("28.09.2021")
                    Text("20:20")
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                
            }
            Divider()
            TextEditor( text:$text)
            Spacer()
        }
        .padding()
    }
}

struct NoteDetails_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetails(name: .constant(""), text: .constant(""), id: UUID())
    }
}

//extension NoteDetails {
//    func textEditorText() -> String {
//        if text == "" {
//            Text("Enter note")
//        } else {
//            TextEditor(text: $text)
//        }
//    }
//}
