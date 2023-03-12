//
//  ContentView.swift
//  Lab3_1
//
//  Created by Mateusz Bartoszek on 12/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var clicks: Int = 0
    var body: some View {
        VStack {
            Text("Wciśnij przycisk")
            MyButton(clicks: $clicks)
            Text("Wciśnięto \(clicks) razy")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
