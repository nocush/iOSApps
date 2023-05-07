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
                        HStack{
                            Image(systemName: "\(id+1).circle").resizable()
                                .frame(width: 30, height: 30)
                            VStack(alignment: .leading){
                                Text("Nazwa: \(self.events[id].name)")
                                Text("Czas trwania: "+String(format: "%.f", self.events[id].duration)+" minut")
                            }.padding()
                        }
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
