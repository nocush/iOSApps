//
//  ContentView.swift
//  Lab6_3
//
//  Created by Mateusz Bartoszek on 04/04/2023.
//

import SwiftUI

struct ContentView: View {
    private let booksManager = BooksManager()
    @State private var pickedAuthor: String = ""
    //@State private var ksiazki: [String] = [""]
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: SecondView(pickedAuthor: $pickedAuthor)){
                    Text("Wybierz autora")
                        .navigationTitle("Autor")
                }
                Divider()
                Text("Dostępne książki autora \(pickedAuthor):")
                    .font(.title)
                ForEach(booksManager.getAllBooks(autor: pickedAuthor),id: \.self){ book in Text(book)}
                
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
