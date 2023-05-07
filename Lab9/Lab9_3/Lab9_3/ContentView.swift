//
//  ContentView.swift
//  Lab9_3
//
//  Created by Mateusz Bartoszek on 07/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var location:CGPoint = CGPoint(
        x:UIScreen.main.bounds.size.width / 2,
        y: UIScreen.main.bounds.size.height / 2)
    var body: some View {
        Circle()
            .fill(Color.mint)
            .frame(width:75,height:75)
            .position(location)
            .gesture(DragGesture()
                .onChanged{
                    self.location = $0.location
                })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
