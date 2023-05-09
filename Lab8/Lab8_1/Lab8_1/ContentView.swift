//
//  ContentView.swift
//  Lab8_1
//
//  Created by Mateusz Bartoszek on 29/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State var events: [Event] = Event.getEvents()
    var body: some View {
        NavigationView{
            List{
                ForEach(events.indices, id: \.self) {id in
                    NavigationLink(destination: EditEvent(events: self.$events, index: id)){
                        Row(event: $events[id],id:id)
                    }.padding()
                }
            }
        }.navigationTitle("Wydarzenia")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
