//
//  ContentView.swift
//  Lab6_1
//
//  Created by Mateusz Bartoszek on 20/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var pickedcolor: Color = Color.black
    @State private var changeView: Bool = true
    var body: some View {
        NavigationView{
            VStack {
                Text("KOLOR").font(.largeTitle)
                    .navigationTitle("Kolory")
                    .foregroundColor(pickedcolor)
                NavigationLink(destination: View2(pickedcolor: $pickedcolor), label:{
                    Image(systemName: "paintpalette").resizable().padding(.top)
                        .frame(width:80,height:80)
                })
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
