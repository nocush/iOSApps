//
//  ContentView.swift
//  Lab9_2
//
//  Created by Mateusz Bartoszek on 07/05/2023.
//

import SwiftUI

let colors: [Color] = [Color.blue, Color.green, Color.indigo, Color.orange, Color.red, Color.pink, Color.mint]

struct ContentView: View {
    @State var index: Int = 0
    var body: some View {
        let longPress = LongPressGesture()
            .onEnded{finished in self.index = self.index + 1}
        
        return Text("Zmieniam kolory")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(colors[index % colors.count])
            .gesture(longPress)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
