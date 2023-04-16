//
//  FlatView.swift
//  Lab7_2
//
//  Created by Mateusz Bartoszek on 16/04/2023.
//

import SwiftUI

struct FlatView: View {
    var flat: Flat
    var body: some View {
        VStack{
            Image(flat.zdjecie).resizable().frame(width:300,height: 200)
            Text(flat.nazwa)
                .font(.largeTitle)
                .padding()
            Text("Powierzchnia: "+String(format:"%.2f",flat.powierzchnia)+" m2").font(.title)
            Text("Liczba pokoi: \(flat.liczbaPokoi)").font(.title)
            if (flat.czyDwupoziomowy == true){
                Text("Czy dwupoziomowy: Tak").font(.title)
            }else{
                Text("Czy dwupoziomowy: Nie").font(.title)
            }
        }
    }
}

struct FlatView_Previews: PreviewProvider {
    static var previews: some View {
        FlatView(flat: Flat(nazwa: "Flat1", powierzchnia: 2137, liczbaPokoi: 2137, czyDwupoziomowy: false, zdjecie: "flat1"))
    }
}
