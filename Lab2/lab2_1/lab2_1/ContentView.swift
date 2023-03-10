//
//  ContentView.swift
//  lab2_1
//
//  Created by student on 07/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var kolory: [Color] = [.red,.blue,.yellow,.green,.gray,.black]
    var body: some View {
        ZStack(alignment:.topTrailing){
            ForEach(0..<kolory.count, id: \.self){ Rectangle().fill(kolory[$0]).frame(width:200,height:200)
                    .offset(x: CGFloat($0)*10.0,y: CGFloat($0)*10.0)
            }            .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
