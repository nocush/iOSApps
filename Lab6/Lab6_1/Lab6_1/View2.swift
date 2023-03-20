//
//  View2.swift
//  Lab6_1
//
//  Created by Mateusz Bartoszek on 20/03/2023.
//

import SwiftUI

struct View2: View {
    @Binding var pickedcolor: Color
    let colors: [Color] = [.green,.blue,.red,.orange]
    var body: some View {
        Text("Wybierz kolor").font(.largeTitle)
            .navigationTitle("Zmiana koloru")
        ForEach(colors,id: \.self){color in
            Button(action: {self.pickedcolor = color},label:{
                Image(systemName: "rectangle.fill").resizable()
                    .frame(width:60,height:50).foregroundColor(color)
            })
        }
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2(pickedcolor: .constant(.black))
    }
}
