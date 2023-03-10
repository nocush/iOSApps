//
//  ContentView.swift
//  lab1
//
//  Created by student on 07/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var dzienwybor:String=""
    @State var dzien: String = ""
    @State var a: String = ""
    @State var b: String = ""
    @State var iloraz: String = ""
    var body: some View {
        VStack {
            Text("Podaj dzień tygodnia").foregroundColor(.red).rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
            TextField("Wpisz dzien tygodnia",text:$dzien)
            Button(action:{ dzienwybor=dzien},label:{(Text("Zatwierdź wybór").foregroundColor(.gray))}).background(RoundedRectangle(cornerRadius: 60).fill(Color.black))
            switch(dzienwybor){
            case "Poniedzialek","Wtorek","Środa","Czwartek","Piątek","Sobota","Niedziela": Text("Wybrano \(dzienwybor)")
            default: Text("Nie istnieje taki dzien")
            }
            TextField("Podaj a",text:$a)
            TextField("Podaj b",text:$b)
            Button(action:{
                if(Double(b)==0){
                    iloraz = "Dzielenie przez 0"
                }else{
                    iloraz = String(Double(a)!/Double(b)!)
                }
            },label:{(Text("Iloraz"))})
            Text("\(iloraz)")
        }
        .padding()
        .multilineTextAlignment(.center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
