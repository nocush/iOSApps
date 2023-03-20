//
//  ContentView.swift
//  Lab6_2
//
//  Created by Mateusz Bartoszek on 20/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var smakSoku: SmakSoku = SmakSoku.Jablkowy
    @State var typKawy: TypKawy = TypKawy.Latte
    var body: some View {
        NavigationView{
            VStack {
                Text("Smak soku: \(smakSoku.rawValue)").padding(.top)
                Text("Rodzaj kawy: \(typKawy.rawValue)")
                
                List{
                    NavigationLink(destination: SmakSokuView(smakSoku: $smakSoku), label: {Text("Wybór smaku soku").padding()})
                    NavigationLink(destination: TypKawyView(typKawy: $typKawy), label: {Text("Rodzaj kawy").padding()})
                }.padding(.vertical)
                
            }.navigationTitle("Restauracja")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
