//
//  NoteCell.swift
//  NotesCFT
//
//  Created by mac on 29.09.2021.
//

import SwiftUI

struct NoteCell: View {
    
//    @EnvironmentObject var noteManager: NoteManager
    
    var name: String
    var text: String
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .minimumScaleFactor(1)
                    .font(.headline)
                Spacer()
                
            }
            Spacer()
            HStack {
                Text("28.09.2021")
                Text("20:20")
                Spacer()
                // если массив с карниками не пуст
                Image(systemName: "photo.on.rectangle")
                //                            .resizable()
                //                            .scaledToFit()
            }
            .font(.footnote)
            .foregroundColor(.secondary)
        }
//        .environmentObject(noteManager)
        .padding(.vertical, 5)
        
    }
}

struct NoteCell_Previews: PreviewProvider {
    static var previews: some View {
        NoteCell(name: "", text: "")
    }
}
