//
//  SmakSokuView.swift
//  Lab6_2
//
//  Created by Mateusz Bartoszek on 20/03/2023.
//

import SwiftUI

enum SmakSoku: String, CaseIterable{
    case Jablkowy, Pomaranczowy, Mango, Bananowy
}

struct SmakSokuView: View {
    @Binding var smakSoku: SmakSoku
    var body: some View {
        VStack{
            ForEach(SmakSoku.allCases, id: \.self){ sok in
                Button(action:{
                    self.smakSoku = sok
                },label:{
                    Image(sok.rawValue).resizable().frame(width:150, height:150)
                })
            }
        }.navigationTitle(Text("Wybierz smak soku"))
    }
}

struct SmakSokuView_Previews: PreviewProvider {
    static var previews: some View {
        SmakSokuView(smakSoku: .constant(SmakSoku.allCases[0]))
    }
}
