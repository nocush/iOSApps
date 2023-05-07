//
//  EditEvent.swift
//  Lab8_1
//
//  Created by Mateusz Bartoszek on 29/04/2023.
//

import SwiftUI

struct EditEvent: View {
    @Binding var events:[Event]
    var index: Int
    @State private var isEditing:Bool = false
    
    init(events: Binding<[Event]>, index: Int){
        self._events = events
        self.index = index
    }
    var body: some View {
        VStack{
            Text("Edytuj").font(.title)
            TextField("Nazwa wydarzenia", text: $events[index].name).multilineTextAlignment(.center)
            Slider(value: $events[index].duration,
                   in:0.0...60.0,
                   step:5,
                   onEditingChanged: {editing in self.isEditing = editing})
            Text("Czas trwania: \(Int(events[index].duration)) minut")
            
        }.padding().padding()
        
        
    }
}

struct EditEvent_Previews: PreviewProvider {
    static var previews: some View {
        EditEvent(events:.constant( [Event(name:"Wydarzenie 1",duration:45)]),index: 0)
    }
}
