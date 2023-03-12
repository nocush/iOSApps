//
//  ContentView.swift
//  Lab3_2
//
//  Created by Mateusz Bartoszek on 12/03/2023.
//

import SwiftUI

struct ContentView: View {
    private let tiresManager: TiresManager = TiresManager()
    @State private var wybranyRozmiar: Int = 15
    @State private var wybranaFirma: String = "Bridgestone"
    @State private var wybranaIlosc: Int = 1
    @State private var dostepnosc: String = ""
    var body: some View {
        VStack {
            Text("Rozmiar opony")
            Picker(selection:$wybranyRozmiar, label: Text("Rozmiar")){
                ForEach(tiresManager.getAllSizes(), id: \.self){ rozmiar in Text(String(rozmiar))}
            }.padding(.vertical).pickerStyle(SegmentedPickerStyle())
            Text("Wybrany rozmiar: \(wybranyRozmiar)")
            Picker(selection: $wybranaFirma,label: Text("Producent")){
                ForEach(tiresManager.getAllManufacturers(),id: \.self) { firma in Text(firma)}
            }
            Text("Wybrana firma: \(wybranaFirma)")
                .padding(.bottom)
            
            Text("Liczba opon").padding(.top)
            TextField("1",text:Binding(get: {String(self.wybranaIlosc)}, set: {self.wybranaIlosc = Int($0) ?? self.wybranaIlosc
                if self.wybranaIlosc < 1 {
                    self.wybranaIlosc = 1
                }
            }))
            .keyboardType(.numberPad)
            .padding()
            .frame(width:80)
            .border(Color.black)
            .multilineTextAlignment(.center)
            Text("Wybrana liczba opon: \(wybranaIlosc)").padding(.bottom)
            
            Button(action: {
                let dostepny = self.tiresManager.checkAvailability(firma: self.wybranaFirma, rozmiar: self.wybranyRozmiar, ilosc: self.wybranaIlosc)
                if dostepny {
                    self.dostepnosc = "Dostepne"
                }else{
                    self.dostepnosc = "Niedostepne"
                }
            }){
                Image(systemName: "cart")
                    .resizable()
                    .frame(width:50,height:50)
            }.padding(.vertical)
            
            Text(dostepnosc)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
