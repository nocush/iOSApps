//
//  TypKawyView.swift
//  Lab6_2
//
//  Created by Mateusz Bartoszek on 20/03/2023.
//

import SwiftUI

enum TypKawy: String, CaseIterable{
    case Cappucino, Latte, Espresso, Dopio
}

struct TypKawyView: View {
    @Binding var typKawy: TypKawy
    var body: some View {
        VStack{
            Picker("Kawa",selection: $typKawy){
                ForEach(TypKawy.allCases, id: \.self){ typKawy in
                    Text(typKawy.rawValue)
                }
            }.padding()
        }.navigationTitle("Wybierz rodzaj kawy")
    }
}

struct TypKawyView_Previews: PreviewProvider {
    static var previews: some View {
        TypKawyView(typKawy: .constant(TypKawy.allCases[0]))
    }
}
