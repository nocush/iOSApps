//
//  Koszyk.swift
//  Projekt
//
//  Created by Mateusz Bartoszek on 27/05/2023.
//

import SwiftUI

enum Smak1: String, CaseIterable{
    case SolonyKarmel, Bananowy, Truskawkowy, Waniliowy, Malinowy, Miętowy, Śmietankowy
}

struct Pudelko1: Identifiable{
    var id = UUID()
    var name: String
    var ileSmakow: Int
    var smaki: [Smak1]
}

struct Koszyk: View {
    @State private var produkty: [Pudelko1] = [Pudelko1(name: "male pudelko", ileSmakow: 2, smaki: [])]
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: PickPudelko()){Text("Dodaj pudełko")}.offset(x:120)
            List{
                ForEach(produkty){pudelko in
                    Section(header:Text("\(pudelko.name)")){
                        ForEach(0..<pudelko.ileSmakow){index in
                            HStack{
                                Text("Smak \(index+1): ")
                            }
                        }
                    }
                }
                }
            }
        }.navigationTitle("Zamówienie")
    }
}

struct Koszyk_Previews: PreviewProvider {
    static var previews: some View {
        Koszyk()
    }
}
