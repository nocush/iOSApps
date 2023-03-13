//
//  ContentView.swift
//  Lab4_2
//
//  Created by Mateusz Bartoszek on 13/03/2023.
//

import SwiftUI

struct ContentView: View {
    private let shapes: [String] = ["Kwadrat","Koło","Trójkąt"]
    private let colors: [String:Color] = ["Czerwony":Color.red, "Niebieski":Color.blue, "Zielony":Color.green, "Fioletowy":Color.purple]
    @State private var selectedShape: String = "Kwadrat"
    @State private var selectedColor: String = "Czerwony"
    @State private var frameSize: Int = 100
    @State private var withFrame = false
    var body: some View {
        VStack {
            Picker(selection:$selectedShape,label:Text("Wybierz kształt")){
                ForEach(shapes,id: \.self){ shape in Text(shape)}
            }.pickerStyle(SegmentedPickerStyle())
            
            Picker(selection:$selectedColor,label:Text("Wybierz kolor")){
                ForEach(Array(colors.keys),id:\.self){key in Text(key)}
            }.pickerStyle(SegmentedPickerStyle())
            
            HStack{
                Text("Frame size").padding(.horizontal)
                TextField("Frame size",text: Binding(get: {String(self.frameSize)}, set: {self.frameSize = Int($0) ?? self.frameSize}))
            }.multilineTextAlignment(.center)
            Toggle("Ramka",isOn: $withFrame).padding(.horizontal)
            switch(selectedShape){
            case "Kwadrat":
                Rectangle()
                    .fill(self.colors[self.selectedColor]!)
                    .padding(5)
                    .frame(width: CGFloat(self.frameSize), height:CGFloat(self.frameSize))
                    .border(Color.black, width:self.withFrame == true ? 5 : 0)
            case "Koło":
                Circle()
                    .fill(self.colors[self.selectedColor]!)
                    .padding(5)
                    .frame(width: CGFloat(self.frameSize), height:CGFloat(self.frameSize))
                    .border(Color.black, width:self.withFrame == true ? 5 : 0)
            case "Trójkąt":
                Triangles()
                    .fill(self.colors[self.selectedColor]!)
                    .padding(5)
                    .frame(width: CGFloat(self.frameSize), height:CGFloat(self.frameSize))
                    .border(Color.black, width:self.withFrame == true ? 5 : 0)
            default:
                Text("Podano błędny kształt")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
