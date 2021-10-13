//
//  NoteCell.swift
//  NotesCFT
//
//  Created by mac on 29.09.2021.
//

import SwiftUI

struct NoteCell: View {
    
    var noteVM: NoteViewModel
    @State private var updatePresented = false

    var body: some View {
        VStack {
            HStack {
                Text(noteVM.name)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .minimumScaleFactor(1)
                    .font(.headline)
                Spacer()
                
            }
            Spacer()
            HStack {
                Text(noteVM.dateString)
                Spacer()
                // если массив с карниками не пуст
                Image(systemName: "photo.on.rectangle")
            }
            .font(.footnote)
            .foregroundColor(.secondary)
        }
        .padding(.vertical, 5)
        
    }
}

//struct NoteCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteCell(noteVM: NoteViewModel)
//    }
//}
