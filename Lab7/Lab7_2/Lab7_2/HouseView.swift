//
//  HouseView.swift
//  Lab7_2
//
//  Created by Mateusz Bartoszek on 16/04/2023.
//

import SwiftUI

struct HouseView: View {
    var house: House
    var body: some View {
        VStack{
            Image(house.zdjecie).resizable().frame(width:300,height: 200)
            Text(house.nazwa)
                .font(.largeTitle)
                .padding()
            Text("Powierzchnia: "+String(format:"%.2f",house.powierzchnia)+" m2").font(.title)
            Text("Liczba pokoi: \(house.liczbaPokoi)").font(.title)
            Text("Wielkość działki: "+String(format:"%.2f",house.wielkoscDzialki)+" m2").font(.title)
            Text("Liczba pięter:  \(house.liczbaPieter)").font(.title)
        }
    }
}

struct HouseView_Previews: PreviewProvider {
    static var previews: some View {
        HouseView(house: House(nazwa: "Dom1", powierzchnia: 146.32, liczbaPokoi: 4, wielkoscDzialki: 167.23, liczbaPieter: 5, zdjecie: "house1"))
    }
}
