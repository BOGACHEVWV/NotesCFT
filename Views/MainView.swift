//
//  MainView.swift
//  NotesCFT
//
//  Created by mac on 26.09.2021.
//

import SwiftUI

struct MainView: View {
        
    var body: some View {
        NavigationView  {
            List(0..<20, id: \.self) { item in
                NavigationLink(destination: NoteView()) {
                    noteCell(item: item)
                }
                
            }
            
            .navigationTitle("Заметки")
            .navigationBarItems(trailing: NavigationLink(destination: NoteView()) {
                Image(systemName: "plus")
                    .font(.title)
            })
        }
        .navigationAppearance(backgroundColor: .systemRed, foregroundColor: .systemBackground, tintColor: .systemBackground, hideSeparator: true)
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct noteCell: View {
    var item: Int
    var body: some View {
        VStack {
            HStack {
                Text("Text  \(item)")
                    .lineLimit(1)
                    .minimumScaleFactor(0.9)
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
        .padding(.vertical, 5)
    }
}

