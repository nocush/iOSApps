//
//  Row.swift
//  Lab8_1
//
//  Created by Mateusz Bartoszek on 09/05/2023.
//

import SwiftUI

struct Row: View {
    @Binding var event: Event
    @State var id: Int
    var body: some View {
        HStack{
            Image(systemName: "\(id+1).circle").resizable()
                .frame(width: 30, height: 30)
            VStack(alignment: .leading){
                Text("Nazwa: \(event.name)")
                Text("Czas trwania: "+String(format: "%.f", event.duration)+" minut")
            }.padding()
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(event: .constant(Event(name: "Wydarzenie1", duration: 0)),id: 0)
    }
}
