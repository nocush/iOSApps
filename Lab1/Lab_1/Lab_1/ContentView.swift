//
//  ContentView.swift
//  Lab_1
//
//  Created by student on 28/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var dzien: String = ""
    @State var dzienwybor: String = ""
    var body: some View {
        VStack (alignment: .leading){
            Text("Podaj wybrany dzien tygodnia:")
            TextField("Wpisz dzien tygodnia",text:$dzien)
            Button(action:{)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
