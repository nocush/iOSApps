//
//  ContentView.swift
//  lab8_2
//
//  Created by Mateusz Bartoszek on 29/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var firstOption: String = ""
    @State private var secondOption: String = ""
    @State private var color: Color = Color.white
    var body: some View {
        VStack {
        
            Menu1(option:$firstOption)
                .padding()
                .padding(.bottom)
            
            Menu2(color: $color)
                .padding()
                .padding(.bottom)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(self.color)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
